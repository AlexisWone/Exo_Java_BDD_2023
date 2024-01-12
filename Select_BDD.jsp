<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);
        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }
        
    %>

<h2>Exercice 1 : Les films entre 2000 et 2015</h2>
<p>Extraire les films dont l'année est supérieur à l'année 2000 et inférieur à 2015.</p>
<%
        String sqlExercice1 = "SELECT idFilm, titre, année FROM Film WHERE année > 2000 AND année < 2015";
        pstmt = conn.prepareStatement(sqlExercice1);
        rs = pstmt.executeQuery();
    
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "<br>");
        }
    %>

<h2>Exercice 2 : Année de recherche</h2>
<p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>
<form action="#" method="post">
    <label for="annee">Année de recherche :</label>
    <input type="text" id="annee" name="annee">
    <input type="submit" value="Rechercher">
</form>
<%
    String anneeRecherche = request.getParameter("annee");
    if (anneeRecherche != null && !anneeRecherche.isEmpty()) {
        String sqlExercice2 = "SELECT idFilm, titre, année FROM Film WHERE année = ?";
        PreparedStatement pstmtExercice2 = conn.prepareStatement(sqlExercice2);
        pstmtExercice2.setString(1, anneeRecherche);
        ResultSet rsExercice2 = pstmtExercice2.executeQuery();

        out.println("<h3>Résultats de la recherche pour l'année " + anneeRecherche + "</h3>");
        while (rsExercice2.next()) {
            out.println("id : " + rsExercice2.getString("idFilm") + ", titre : " + rsExercice2.getString("titre") +
                    ", année : " + rsExercice2.getString("année") + "</br>");
        }

        rsExercice2.close();
        pstmtExercice2.close();
    }
%>

<h2>Exercice 3 : Modification du titre du film</h2>
<p>Créer un formulaire permettant de modifier le titre d'un film sur la base de son ID (ID choisi par l'utilisateur)</p>
<form action="#" method="post">
    <label for="idFilm">ID du film :</label>
    <input type="text" id="idFilm" name="idFilm">
    <label for="nouveauTitre">Nouveau titre :</label>
    <input type="text" id="nouveauTitre" name="nouveauTitre">
    <input type="submit" value="Modifier">
</form>

<%
    // Traitement de la modification du titre du film
    String idFilmAModifier = request.getParameter("idFilm");
    String nouveauTitre = request.getParameter("nouveauTitre");
    if (idFilmAModifier != null && !idFilmAModifier.isEmpty() && nouveauTitre != null && !nouveauTitre.isEmpty()) {
        String sqlExercice3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
        PreparedStatement pstmtExercice3 = conn.prepareStatement(sqlExercice3);
        pstmtExercice3.setString(1, nouveauTitre);
        pstmtExercice3.setString(2, idFilmAModifier);
        int rowsUpdated = pstmtExercice3.executeUpdate();

        out.println("<h3>Résultat de la modification du titre</h3>");
        out.println(rowsUpdated + " la ligne(s) à était mise(s) à jour");
        pstmtExercice3.close();
    }
%>

<h2>Exercice 4 : La valeur maximum</h2>
<p>Créer un formulaire pour saisir un nouveau film dans la base de données</p>
    <%
        rs.close();
        pstmt.close();
        conn.close();

%>
</body>
</html>
