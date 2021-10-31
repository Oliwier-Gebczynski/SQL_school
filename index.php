<?php
//$link = @mysqli_connect("localhost", "root", "", "test");
//if (!$link){
	//echo "Blad: ".mysqli_connect_error();
//}else{
	//echo "Polacznie ok!";
//};

$link = new mysqli("localhost", "root", "", "test");

if($link -> connect_error){
	echo "Blad: ".$link -> connect_error;
	exit();
}
else{
	echo "Okej";
}

$query = "select * from pierwszy";

$result = mysqli_query($link, $query);

echo $wynik = mysqli_num_rows($result);
echo '<br>';

$wynik = mysqli_fetch_assoc($result);

while($wynik2 = mysqli_fetch_assoc($result)){
	print_r($wynik2);
	echo '<br>';
}
echo '<br>';

while($wynik1 = $result -> fetch_assoc()){
	print_r($wynik1);
	echo '<br>';
}

while($wynik = mysqli_fetch_assoc($result)){
	echo $wynik['imie'].''.$wynik['nazwisko'];
	echo '<br>';
}

$link = @mysqli_connect("localhost", "root", "", "test");
mysqli_set_charset($link, "utf8");

$query = "INSERT INTO pierwszy VALUES(NULL, 'imie', 'nazwisko', '129')";

$e = mysqli_query($link,$query) or die(mysqli_error($link));

mysqli_close($link);

?>