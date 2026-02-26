<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.io.*, java.util.*, java.nio.file.*, java.nio.charset.StandardCharsets" %>
        <% response.setContentType("application/json"); response.setCharacterEncoding("UTF-8"); String
            targetPathStr="c:\\Albero\\webapps\\primo\\ROOT\\xyz\\catalogo_prodotti.txt" ; File targetFile=new
            File(targetPathStr); try { StringBuilder sb=new StringBuilder(); BufferedReader reader=request.getReader();
            String line; while ((line=reader.readLine()) !=null) { sb.append(line); } String payload=sb.toString(); if
            (payload !=null && !payload.trim().isEmpty()) { Files.write(targetFile.toPath(),
            payload.getBytes(StandardCharsets.UTF_8)); out.print("{\"success\": true, \"message\": \"Catalogo salvato
            con successo\"}"); } else { out.print("{\"success\": false, \"error\": \"Payload vuoto\"}"); } } catch
            (Exception e) { response.setStatus(500); String msg=e.getMessage(); if(msg==null) msg=e.toString();
            msg=msg.replace("\"", "\\\"");
        out.print(" {\"success\": false, \"error\": \"" + msg + "\" }"); } %>