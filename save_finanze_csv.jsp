<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.io.*, java.util.*, java.nio.file.*, java.nio.charset.StandardCharsets" %>
        <% response.setContentType("application/json"); response.setCharacterEncoding("UTF-8"); // Generiamo un nome
            file basato sull'orario o accettato da POST String
            targetPathStr="c:\\Albero\\webapps\\primo\\ROOT\\xyz\\finanze_export.csv" ; File targetFile=new
            File(targetPathStr); try { StringBuilder sb=new StringBuilder(); BufferedReader reader=request.getReader();
            String line; while ((line=reader.readLine()) !=null) { sb.append(line).append("\n"); // Ripristiniamo il
            newline se arriva dal payload raw } String payload=sb.toString(); if (payload !=null &&
            !payload.trim().isEmpty()) { Files.write(targetFile.toPath(), payload.getBytes(StandardCharsets.UTF_8));
            out.print("{\"success\": true, \"message\": \"Export salvato su server: finanze_export.csv\", \"path\":
            \"finanze_export.csv\"}"); } else { out.print("{\"success\": false, \"error\": \"Payload CSV vuoto\"}"); } }
            catch (Exception e) { response.setStatus(500); String msg=e.getMessage(); if(msg==null) msg=e.toString();
            msg=msg.replace("\"", "\\\"");
        out.print(" {\"success\": false, \"error\": \"" + msg + "\" }"); } %>