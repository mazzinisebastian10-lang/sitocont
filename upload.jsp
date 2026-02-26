<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.io.*, java.util.*, java.nio.file.*, java.util.Base64" %>
        <% try { StringBuilder sb=new StringBuilder(); BufferedReader reader=request.getReader(); String line; while
            ((line=reader.readLine()) !=null) { sb.append(line); } String payload=sb.toString(); if(payload !=null &&
            payload.contains("|||")) { String[] parts=payload.split("\\|\\|\\|"); String filename=parts[0]; String
            base64=parts[1]; if (base64.contains(",")) { base64=base64.substring(base64.indexOf(",") + 1); } byte[]
            fileBytes=Base64.getDecoder().decode(base64); String uploadDir=application.getRealPath("/xyz/uploads/");
            File dir=new File(uploadDir); if (!dir.exists()) { dir.mkdirs(); } String
            safeName=System.currentTimeMillis() + "_" + filename.replaceAll("[^a-zA-Z0-9\\.\\-]", "_" ); File dest=new
            File(dir, safeName); FileOutputStream fos=new FileOutputStream(dest); fos.write(fileBytes); fos.close();
            out.print("{\"success\":true, \"path\":\"uploads/" + safeName + "\" }"); } else {
            out.print("{\"success\":false, \"error\":\"Invalid payload\"}"); } } catch (Exception e) {
            response.setStatus(500); out.print("{\"success\":false, \"error\":\"Server Error\"}"); } %>