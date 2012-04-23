<div class='inscription'>
<div class='height'>
	<form id="start" method="post" action="MainControler.php?action=inscription">
		<h1> Inscription </h1>
		<p> <label> Pseudo </label> <input type="text" name="pseudo" value="<?php if(isset($MyPost['pseudo'])){echo $MyPost['pseudo'];}?>" maxlength="20" required /> (4 carac mini) </p>
		<p> <label> Nom </label> <input type="text" name="name" value="<?php if(isset($MyPost['name'])){echo $MyPost['name'];}?>" maxlength="20" required /> </p>
		<p> <label> Prénom </label> <input type="text" name="firstname" value="<?php if(isset($MyPost['firstname'])){echo $MyPost['firstname'];}?>"  maxlength="20" required /> </p>
		<p> <label> E-mail </label> <input type="email" name="email" value="<?php if(isset($MyPost['email'])){echo $MyPost['email'];}?>"  maxlength="255" required /> </p>
		<p> <label> Confimation E-mail </label> <input type="email" name="confirmEmail" value="<?php if(isset($MyPost['confirmEmail'])){echo $MyPost['confirmEmail'];}?>"  maxlength="255" required /> </p>
		<p> <label> Date de naissance </label> 
		<select name="day">
		<?php for ($day = 1 ; $day <= 31 ; $day++)
			{
		?>
		<option value="<?php echo $day ?>"><?php echo $day; ?></option>
		<?php	           
			}
		?>	
		</select>
		<select name="month">
		<?php for ($month = 1 ; $month <= 12 ; $month++)
			{
		?>
		<option value="<?php echo $month ?>"><?php echo $month; ?></option>
		<?php	           
			}
		?>	
		</select>
		<select name="year">
		<?php for ($year = 2012 ; $year >= 1900 ; $year--)
			{
		?>
		<option value="<?php echo $year ?>"><?php echo $year; ?></option>
		<?php	           
			}
		?>	
		</select> </p>
		<p> <label> Mot de passe </label> <input type="password" name="password" maxlength="20" required /> (6 carac mini) </p>
		<p> <label> Confirmation mot de passe </label> <input type="password" name="confirmPassword" maxlength="20" required /> </p>
		<p> <input type="submit" name="submit" value="Valider" class="button" align="center"/> </p>
		<p style="text-align:center"><a href="MainControler.php?action=home.view.php"> Retour à la page d'accueil </a></p>
</form>
</div>
</div>