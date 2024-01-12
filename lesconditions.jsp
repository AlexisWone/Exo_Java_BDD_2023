<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur A : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur B : <input type="text" id="inputValeur" name="valeur2">
    <p>Saisir la valeur C : <input type="text" id="inputValeur" name="valeur3">
    <p>Saisir une valeur Paire ou Impaire : <input type="text" id="inputValeur" name="valeur4">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>
    <% String valeur3 = request.getParameter("valeur3"); %>
    <% String valeur4 = request.getParameter("valeur4"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>

<%-- Récupération des valeurs 1,2 et 3--%>
<% String valeurA = request.getParameter("valeur1"); %>
<% String valeurB = request.getParameter("valeur2"); %>
<% String valeurC = request.getParameter("valeur3"); %>

<%-- Vérification de la condition--%>
<% if (valeurA != null && valeurB != null && valeurC != null) { %>
    <%-- Conversion des valeurs en entiers pour la comparaison --%>
    <% int intValeurA = Integer.parseInt(valeurA); %>
    <% int intValeurB = Integer.parseInt(valeurB); %>
    <% int intValeurC = Integer.parseInt(valeurC); %>

    <%-- Condition if pour vérifier si C est compris entre A et B --%>
    <%
    if (intValeurC > intValeurA && intValeurC < intValeurB) {
    %>
        <p>Oui, C est compris entre A et B.</p>
    <%
    } else {
    %>
        <p>Non, C n'est pas compris entre A et B.</p>
    <%
    }
    %>
<% } %>


Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>
<% String nombreValue = request.getParameter("valeur4"); %>
<%-- Vérification si la 4 eme valeur rentré est paire où impaire --%>
<% if (nombreValue != null) { %>
    <%-- Conversion de la valeur en entier --%>
    <% int intNombre = Integer.parseInt(nombreValue); %>
    <%if (intNombre % 2 == 0) {%>
            <p>La 4eme valeur rentré est est pair.</p>
    <%} else {%>
        <p>la 4eme valeur rentré est impair.</p>
    <%}%>
<%}%>
<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
