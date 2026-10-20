<?php include('inde.php'); // ye db connection wali file hai ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paper Supply System</title>
    <style>
        body{font-family: Arial; background:#f4f6f9; padding:20px;}
        .container{max-width:600px; margin:auto; background:#fff; padding:25px; border-radius:10px; box-shadow:0 4px 10px rgba(0,0,0,0.1);}
        h2{text-align:center; color:#333;}
        label{font-weight:bold; display:block; margin-top:15px;}
        input, select{width:100%; padding:10px; margin-top:5px; border:1px solid #ccc; border-radius:5px;}
        input[type="submit"]{background:#007bff; color:white; border:none; cursor:pointer; margin-top:20px; font-size:16px;}
        input[type="submit"]:hover{background:#0056b3;}
        table{width:100%; margin-top:30px; border-collapse:collapse;}
        th, td{padding:10px; border:1px solid #ddd; text-align:center;}
        th{background:#007bff; color:white;}
    </style>
</head>
<body>
<div class="container">
    <h2>Paper Supply Form</h2>
    <form method="POST">
        <label>PaperType:</label>
        <select name="pprtyp" id="pprtyp" onchange="fun2()" required>
            <option value="">Select Paper</option>
            <?php
            $sql1="SELECT * FROM mst_tbl";
            $query1=mysqli_query($conn,$sql1);
            while($row1=mysqli_fetch_assoc($query1)){
                echo "<option value='".$row1['PaperTypeCode']."' data-rate='".$row1['PriceofReam']."'>".$row1['PaperTypeName']."</option>";
            }
            ?>
        </select>

        <label>SupplyDate:</label>
        <input type="date" name="sdate" id="sdate" required>

        <label>CustomerName:</label>
        <input type="text" name="cname" id="cname" required>

        <label>QtyRequired:</label>
        <input type="number" name="qtyr" id="qtyr">

        <label>QtyIssued:</label>
        <input type="number" name="qtyi" id="qtyi" oninput="fun()">

        <label>Total:</label>
        <input type="number" name="total" id="total" readonly>

        <input type="submit" name="submit" value="Submit">
    </form>
</div>

<script>
    var rate = 0; 
    function fun2(){
        var ppr=document.getElementById('pprtyp');
        rate = ppr.options[ppr.selectedIndex].getAttribute('data-rate'); 
        fun();
    }
    function fun(){
        var issue = parseInt(document.getElementById('qtyi').value) || 0;
        var tream = document.getElementById('total');
        if(issue > 10){
            alert("Max 10 ream allowed");
            document.getElementById('qtyi').value = 10;
            issue = 10;
        }
        tream.value = rate * issue; 
    }
</script>

<?php
if(isset($_POST['submit'])){
 $pprtyp=$_POST['pprtyp'];
 $date=$_POST['sdate'];
 $cname=$_POST['cname'];
 $qtyr=$_POST['qtyr'];
 $qtyi=$_POST['qtyi'];
 $total=$_POST['total'];
 $sql2="INSERT INTO transactiontbl(PaperTypeCode,SupplyDate,CustomerName,QtyRequired,QtyIssued,Total) VALUES ('$pprtyp','$date','$cname','$qtyr','$qtyi','$total')";
 $query2=mysqli_query($conn,$sql2);
 if($query2){ echo "<script>alert('Inserted Successfully');</script>"; }
}
?>
<br>
<table border=2>
<tr><th>S.No.</th><th>PaperType</th><th>SupplyDate</th><th>CustomerName</th><th>Total</th></tr>
<?php
$sql="SELECT transactiontbl.*, mst_tbl.PaperTypeName FROM transactiontbl INNER JOIN mst_tbl ON mst_tbl.PaperTypeCode=transactiontbl.PaperTypeCode";
$query=mysqli_query($conn,$sql);
$r=1;
while($row=mysqli_fetch_assoc($query)){
    echo "<tr><td>".$r++."</td><td>".$row['PaperTypeName']."</td><td>".$row['SupplyDate']."</td><td>".$row['CustomerName']."</td><td>".$row['Total']."</td></tr>";
}
?>
</table>
</body>
</html>