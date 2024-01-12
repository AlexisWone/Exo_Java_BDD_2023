<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimu 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

    <%-- Division de la chaîne de chiffres séparés par des espaces --%>
    <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
    <p>La tableau contient <%= tableauDeChiffres.length %> valeurs</br>
   <%for (int i=0; i<tableauDeChiffres.length; i++) {%>
          <p>Chiffre <%=i%> : <%= Integer.parseInt(tableauDeChiffres[i]) %></p>
    <%}%>
    
<h2>Exercice 1 : La carré de la première valeur</h2>
<p>Ecrire un programme afin d'afficher le carré de la première valeur</p>
<p>Le carré de la première valeur est égale à : <%= Math.pow(Integer.parseInt(tableauDeChiffres[0]), 2) %></p>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<p>Ecrire un programme afin d'afficher la somme des deux premières valeurs</p>
<p>La somme des deux premières valeurs = <%= Integer.parseInt(tableauDeChiffres[0]) + Integer.parseInt(tableauDeChiffres[1]) %></p>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<p>L'utilisateur peut à présent saisir autant de valeurs qu'il le souhaite dans champs de saisie.</br>
Ecrire un programme afin de faire la somme de toutes les valeurs saisie par l'utilisateur</p>
<%
   int SommeChiffre = 0;
   for (int i=0; i<tableauDeChiffres.length; i++) {
      SommeChiffre += Integer.parseInt(tableauDeChiffres[i]);
   }
%>
<p>La somme des deux premières valeurs = <%= SommeChiffre %></p> 
<h2>Exercice 4 : La valeur maximum</h2>
<p>Ecrire un programme pour afficher la valeur maximale saisie par l'utilisateur</p>
<%
   int max = Integer.parseInt(tableauDeChiffres[0]);
   for (int i=0; i<tableauDeChiffres.length; i++) {
      int valeur = Integer.parseInt(tableauDeChiffres[i]);
      if (valeur > max) {
         max = valeur;
      }
   }
%>
<p>La valeur max est : <%= max %></p> 

<h2>Exercice 5 : La valeur minimale</h2>
<p>Ecrire un programme pour afficher la valeur minimale saisie par l'utilisateur</p>
<%
   int min = Integer.parseInt(tableauDeChiffres[0]);
   for (int i=0; i<tableauDeChiffres.length; i++) {
      int valeur = Integer.parseInt(tableauDeChiffres[i]);
      if (valeur < min) {
         min = valeur;
      }
   }
%>
<p>La valeur max est : <%= min %></p> 

<h2>Exercice 6 : La valeur le plus proche de 0</h2>
<p>Trouvez la valeur la plus proche de 0 (chiffres positifs ou négatifs)</p>
    <%
       int ProcheDeZero = Integer.parseInt(tableauDeChiffres[0]);
       for (int i=0; i<tableauDeChiffres.length; i++) {
          int valeur = Integer.parseInt(tableauDeChiffres[i]);
          if (Math.abs(valeur) < Math.abs(ProcheDeZero)) {
             ProcheDeZero = valeur;
          }
       }
    %>
<p>La valeur la plus proche de 0 est : <%= ProcheDeZero %></p>

<h2>Exercice 7 : La valeur le plus proche de 0 (2° version)</h2>
<p>Trouvez la valeur la plus proche de 0 (chiffres positifs ou négatifs)</p>
<p>En cas d'égalité entre un chiffre positif et négatif, affichez le chiffre positif</p>
   <%
        int ProcheDeZero2 = Integer.parseInt(tableauDeChiffres[0]);
        for (int i=0; i<tableauDeChiffres.length; i++) {
            int valeur = Integer.parseInt(tableauDeChiffres[i]);
            if (Math.abs(valeur) < Math.abs(ProcheDeZero2) || (Math.abs(valeur) == Math.abs(ProcheDeZero2) && valeur > 0)) {
                ProcheDeZero2 = valeur;
            }
        }
    %>
<p>La valeur la plus proche de 0 (2° version) est : <%= ProcheDeZero2 %></p>
<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
