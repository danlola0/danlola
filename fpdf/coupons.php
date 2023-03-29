<?php

require('fpdf.php');
$conn = new PDO('mysql:host=localhost;dbname=deliberation', 'root', '');
$id = $_GET['id'];

// Retrieve the data from the database
$sql = "SELECT * FROM v_pdf where t_etudiant_id = $id";
$result = $conn->query($sql);
$result2 = $conn->query($sql);
$rr = $result->fetchAll();

// Create a new PDF instance
$pdf = new FPDF();

// Add a new page
$pdf->AddPage();

// Set font and font size for the title
$pdf->SetFont('Arial', 'B', 16);

// Add a title
$pdf->Cell(0, 10, 'RELEVE DE COTE FACULTE DE SCIENCE', 0, 1, 'C');

// Set font and font size for the table headers
$pdf->SetFont('Arial', 'B', 12);
$pdf->cell(30, 10, ' ' . 'Etudiant: ' . $rr[0]['t_etudiant_nom'] . ' ', 1, 0, 'C');
$pdf->Ln(20);

// Set table headers
$pdf->Cell(50, 10, 'cour', 1, 0, 'C');
$pdf->Cell(50, 10, 'ponderation', 1, 0, 'C');
$pdf->Cell(50, 10, 'cote', 1, 1, 'C');

// Set font and font size for the table data
$pdf->SetFont('Arial', '', 12);

// Initialize the sum variable
$sum = 0;
$total_ponderation = 0; // Initialize the total ponderation variable

// Add table data from database query
if ($result->rowCount() > 0) {
    while ($row = $result2->fetch()) {
        $pdf->Cell(50, 10, $row["t_cour_nom"], 1, 0, 'C');
        $pdf->Cell(50, 10, $row["t_cour_ponderation"] * 20, 1, 0, 'C');
        // Add the weighted score to the sum variable
        $sum += $row["t_cour_ponderation"] * 20 * $row["t_deliberation_cote"] / 20;
        $pdf->Cell(50, 10, $row["t_deliberation_cote"], 1, 1, 'C');
        // Add the current course ponderation to the total ponderation variable
        $total_ponderation += $row["t_cour_ponderation"] * 20;
    }
}
// Calculate the percentage
$percentage = round($sum * 100 / $total_ponderation);

// Output the total ponderation
$pdf->Cell(50, 10, 'Total ponderation:', 1, 0, 'C');
$pdf->Cell(50, 10, $total_ponderation, 1, 0, 'C');
$pdf->Cell(50, 10, '', 1, 1, 'C');

// Output the sum of weighted scores
$pdf->Cell(50, 10, 'Total weighted score:', 1, 0, 'C');
$pdf->Cell(50, 10, '', 1, 0, 'C');
$pdf->Cell(50, 10, $sum, 1, 1, 'C');

// Output the percentage
$pdf->Ln(10);
$pdf->Cell(0, 10, 'Pourcentage : ' . $percentage . '%', 0, 1, 'C');

// Output student's mention based on percentage
if ($percentage >=80) {
    $pdf->Ln(10);
    $pdf->Cell(0, 10, 'Mention : Distinction', 0, 1, 'C');
} elseif ($percentage >= 70) {
    $pdf->Ln(10);
    $pdf->Cell(0, 10, 'Mention : Satisfaction', 0, 1, 'C');
} elseif ($percentage >=50) {
    $pdf->Ln(10);
    $pdf->Cell(0, 10, 'Mention : Ajournée', 0, 1, 'C');
} 

// Output the PDF document
$pdf->Output();



?>