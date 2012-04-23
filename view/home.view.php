<div class='home'>
<table border = '0' class ='tab'>
	<tr>
		<td  align="center" class='text'>
			Identifiant/e-mail :
		</td>
		<td  align="center" >
			<form method='post' action='MainControler.php?action=connexion'>
				<input type='text' value="<?php if(isset($MyPost['login'])){echo $MyPost['login'];}?>" maxlength='255' name='login' required >
			
		</td>
		<td  align="center" class='text'>
			Mot de passe : 
		</td>
		<td  align="center" >
				<input type='password' value='' maxlength='20' name='password' required >
		</td>
		<td align="center" >
				<input class='button' type='submit' name="submit" value='Connexion' >
		</td>
		</form>
		<td align="center" >
			<form method='post' action='MainControler.php?action=inscription'>
				<input class='button' type='submit' value='Inscription' >
		</td>	
			</form>
	</tr>
</table>
<div class='mdp'>
			<a href="../controler/MainControler.php?action=forget_password"><div class='mdpT'>Mot de passe oublié ? </div></a> 
</div>
<div class='height'>
<hr size='2'color='#969090'/>
Bienvenue sur Family Life, LE site de gestion de famille ! <br/>
Ce site vous propose de nombreux services permettant de gérer et d'organiser votre foyer familial au quotidien. <br/>
Vous souhaitez gérer votre emploi du temps personnel comme professionnel ? L'application Agenda est faite pour vous ! <br/>
Ayez un accès aux résultats de vos enfants et suivez leur progression grâce à l'application Résultats. <br/>
D'autres applications comme le gestionnaire de budget ou la liste de courses sont disponibles, inscrivez-vous pour les découvrir ! <br/>
</div>
</div>

