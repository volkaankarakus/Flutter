<?php
$response = array();

if(isset($_POST['kisi_id'])) {  // android tarafindan kisinin id'sini gondericez.
    $kisi_id = $_POST['kisi_id']; // veri geldiyse bunu kisi_id'ye atiyoruz.

    // DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE değiskenlerini db_config'ten alalim.
    require_once __DIR__ . '/db_config.php';

    // Baglanti olusturuyoruz
    $baglanti = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

    // Baglanti kontrolu yapalim
    if (!$baglanti) {
        die('Hatali baglanti : ' . mysqli_connect_error());
    }

    $sqlsorgu = "DELETE FROM kisiler WHERE kisiler.kisi_id = $kisi_id";

    if (mysqli_query($baglanti, $sqlsorgu)) {
        $response['success'] = 1;
        $response['message'] = 'succesfully';
        echo json_encode($response);

    } else {
        $response['success'] = 0;
        $response['message'] = 'No product found';
        echo json_encode($response);

    }

    // Baglantiyi koparalim
    mysqli_close($baglanti);
}

else{
    $response['success'] = 0;
    $response['message'] = 'Required field(s) is missing';
    echo json_encode($response);
}
?>
