<?php
include "includes/config.php";

$readAlt = mysqli_query($koneksi, "SELECT * FROM alternatif ORDER BY hasil_alternatif DESC LIMIT 10");
$readKriteria = mysqli_query($koneksi, "SELECT * FROM kriteria ORDER BY id_kriteria ASC");
$totalKriteria = mysqli_num_rows($readKriteria);

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Laporan Perankingan <?php echo date('Y-m-d'); ?></title>
    <style>
        @page {
            margin: 2cm;
            size: A4;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Arial, sans-serif;
            font-size: 11px;
            line-height: 1.4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 100%;
            margin: 0 auto;
        }
        
        .header {
            text-align: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 3px solid #2c3e50;
        }
        
        .header h1 {
            color: #2c3e50;
            font-size: 22px;
            margin: 0 0 8px 0;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .header h2 {
            color: #7f8c8d;
            font-size: 14px;
            margin: 0;
            font-weight: normal;
        }
        
        .meta-info {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            gap: 15px;
            margin-bottom: 20px;
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #dee2e6;
        }
        
        .meta-item {
            text-align: center;
            padding: 8px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .meta-label {
            font-size: 9px;
            color: #6c757d;
            text-transform: uppercase;
            font-weight: bold;
            margin-bottom: 3px;
        }
        
        .meta-value {
            font-size: 12px;
            color: #2c3e50;
            font-weight: bold;
        }
        
        .summary {
            background: linear-gradient(135deg, #e8f4fd, #d1ecf1);
            border-left: 5px solid #3498db;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 0 8px 8px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .summary h3 {
            margin: 0 0 10px 0;
            color: #2c3e50;
            font-size: 13px;
            display: flex;
            align-items: center;
        }
        
        .summary h3::before {
            content: "📊";
            margin-right: 8px;
            font-size: 16px;
        }
        
        .summary ul {
            margin: 0;
            padding-left: 15px;
        }
        
        .summary li {
            margin-bottom: 5px;
            font-size: 10px;
            color: #495057;
            line-height: 1.5;
        }
        
        .main-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        
        .table-header {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 12px 8px;
            text-align: center;
            font-weight: bold;
            font-size: 10px;
            border: none;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .criteria-header {
            background: linear-gradient(135deg, #9b59b6, #8e44ad);
            color: white;
            padding: 10px 6px;
            text-align: center;
            font-weight: bold;
            font-size: 9px;
            border: none;
        }
        
        .table-cell {
            padding: 10px 8px;
            text-align: center;
            border: 1px solid #dee2e6;
            font-size: 10px;
            transition: background-color 0.3s;
        }
        
        .table-row:nth-child(even) .table-cell {
            background-color: #f8f9fa;
        }
        
        .table-row:nth-child(odd) .table-cell {
            background-color: white;
        }
        
        .rank-cell {
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            color: white;
        }
        
        .rank-1 {
            background: linear-gradient(135deg, #3498db, #2980b9) !important;
            color: white;
        }
        
        .rank-2 {
            background: linear-gradient(135deg, #27ae60, #229954) !important;
            color: white;
        }
        
        .rank-3 {
            background: linear-gradient(135deg, #e67e22, #d35400) !important;
            color: white;
        }
        
        .rank-other {
            background: linear-gradient(135deg, #95a5a6, #7f8c8d) !important;
            color: white;
            font-weight: bold;
        }
        
        .alt-name {
            text-align: left !important;
            font-weight: bold;
            color: #2c3e50;
            background: linear-gradient(135deg, #ecf0f1, #d5dbdb) !important;
            padding-left: 12px !important;
        }
        
        .result-value {
            background: linear-gradient(135deg, #27ae60, #229954) !important;
            color: white;
            font-weight: bold;
            font-size: 11px;
            text-align: center;
        }
        
        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 9px;
            color: #6c757d;
            border-top: 2px solid #dee2e6;
            padding-top: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
        }
        
        .footer-title {
            font-size: 12px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .footer-title::before {
            content: "📈";
            margin-right: 8px;
            font-size: 16px;
        }
        
        .print-button {
            position: fixed;
            top: 20px;
            right: 20px;
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 3px 10px rgba(52,152,219,0.3);
            transition: all 0.3s;
            z-index: 1000;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 12px;
        }
        
        .print-button:hover {
            background: linear-gradient(135deg, #2980b9, #21618c);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        @media print {
            .print-button { display: none; }
            body { font-size: 10px; }
            .meta-info { grid-template-columns: 1fr 1fr; }
            .table-cell { padding: 6px 4px; }
            
            /* Hilangkan header dan footer browser saat print */
            @page {
                margin: 1cm;
                size: A4;
            }
            
            /* Override browser print styles */
            html, body {
                width: 210mm;
                height: 297mm;
                margin: 0 !important;
                padding: 0 !important;
                overflow: hidden;
            }
        }
    </style>
</head>
<body>
    <button class="print-button" onclick="window.print()" title="Cetak atau simpan sebagai PDF">
        🖨️ Cetak PDF
    </button>
    
    <div class="container">
        <div class="header">
            <h1>Laporan Hasil Perankingan</h1>
            <h2>Sistem Pendukung Keputusan</h2>
        </div>
        
        <div class="meta-info">
            <div class="meta-item">
                <div class="meta-label">📅 Tanggal Cetak</div>
                <div class="meta-value"><?php echo date('d F Y'); ?></div>
            </div>
            <div class="meta-item">
                <div class="meta-label">⏰ Waktu Cetak</div>
                <div class="meta-value"><?php echo date('H:i:s'); ?> WIB</div>
            </div>
            <div class="meta-item">
                <div class="meta-label">📊 Total Kriteria</div>
                <div class="meta-value"><?php echo $totalKriteria; ?> Kriteria</div>
            </div>
            <div class="meta-item">
                <div class="meta-label">🏆 Jumlah Data</div>
                <div class="meta-value">10 Teratas</div>
            </div>
        </div>
        
        <table class="main-table">
            <thead>
                <tr>
                    <th rowspan="2" class="table-header" style="width: 10%;">🏆<br>Peringkat</th>
                    <th rowspan="2" class="table-header" style="width: 25%;">📋<br>Nama Alternatif</th>
                    <th colspan="<?php echo $totalKriteria; ?>" class="criteria-header">📊 Kriteria Penilaian</th>
                    <th rowspan="2" class="table-header" style="width: 12%;">Nilai Akhir</th>
                </tr>
                <tr>
                    <?php
                    mysqli_data_seek($readKriteria, 0);
                    while($rk = mysqli_fetch_assoc($readKriteria)){
                        echo "<th class='criteria-header'>".htmlspecialchars($rk['nama_kriteria'])."</th>";
                    }
                    ?>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = 1;
                while($alt = mysqli_fetch_assoc($readAlt)){
                    $rankClass = '';
                    
                    switch($no) {
                        case 1: 
                            $rankClass = 'rank-1'; 
                            break;
                        case 2: 
                            $rankClass = 'rank-2'; 
                            break;
                        case 3: 
                            $rankClass = 'rank-3'; 
                            break;
                        default: 
                            $rankClass = 'rank-other'; 
                            break;
                    }
                    
                    echo "<tr class='table-row'>
                            <td class='table-cell rank-cell $rankClass'>$no</td>
                            <td class='table-cell alt-name'>".htmlspecialchars($alt['nama_alternatif'])."</td>";

                    $idAlt = $alt['id_alternatif'];
                    $readR = mysqli_query($koneksi,"SELECT c.bobot_normalisasi 
                                                   FROM rangking c
                                                   JOIN kriteria b ON b.id_kriteria = c.id_kriteria
                                                   WHERE c.id_alternatif='$idAlt'
                                                   ORDER BY b.id_kriteria ASC");

                    while($r = mysqli_fetch_assoc($readR)){
                        $nilai = round($r['bobot_normalisasi'], 4);
                        echo "<td class='table-cell'>$nilai</td>";
                    }

                    $hasil = round($alt['hasil_alternatif'], 4);
                    echo "<td class='table-cell result-value'>$hasil</td>
                          </tr>";
                    $no++;
                }
                ?>
            </tbody>
        </table>
        
        <div class="summary">
            <h3>Ringkasan Perankingan</h3>
            <ul>
                <li>Laporan ini menampilkan 10 alternatif terbaik berdasarkan perhitungan sistem pendukung keputusan</li>
                <li>Nilai hasil merupakan akumulasi dari bobot normalisasi setiap kriteria yang telah dihitung</li>
                <li>Peringkat ditentukan berdasarkan nilai akhir tertinggi ke terendah</li>
                <li>Top 3 peringkat ditandai dengan warna berbeda untuk kemudahan identifikasi</li>
            </ul>
        </div>
        
        <div class="footer">
            <div class="footer-title">Sistem Pendukung Keputusan</div>
            <p>Dokumen ini dibuat secara otomatis oleh sistem pada <?php echo date('d F Y H:i:s'); ?> WIB</p>
            <p>© <?php echo date('Y'); ?> - Laporan Perankingan Alternatif</p>
        </div>
    </div>
    
    <script>
        document.title = 'Laporan_Perankingan_<?php echo date("Y-m-d"); ?>';
        
        document.addEventListener('DOMContentLoaded', function() {
            if (window.location.search.includes('autoprint=1')) {
                setTimeout(() => window.print(), 800);
            }
        });
        
        document.addEventListener('keydown', function(e) {
            if (e.ctrlKey && e.key === 'p') {
                e.preventDefault();
                window.print();
            }
        });
    </script>
</body>
</html>