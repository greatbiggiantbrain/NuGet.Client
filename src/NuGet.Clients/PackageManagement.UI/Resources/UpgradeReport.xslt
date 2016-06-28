﻿<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl='urn:schemas-microsoft-com:xslt'>
  <xsl:output omit-xml-declaration="yes" />

  <!-- Issue row templates -->
  <xsl:template match="Issue">
    <tr>
      <td>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="@Level = '2'">IconErrorEncoded</xsl:when>
            <xsl:when test="@Level = '1'">IconWarningEncoded</xsl:when>
            <xsl:when test="@Level = '0'">IconInfoEncoded</xsl:when>
          </xsl:choose>
        </xsl:attribute>
      </td>
      <td class="issueCell">
        <span>
          <xsl:value-of select="@Description" />
        </span>
      </td>
    </tr>
  </xsl:template>

  <!-- Included Packages Template -->
  <xsl:template match="Projects" mode="IncludedPackages">
    <xsl:for-each select="Project">
      <xsl:variable name="includedPackageCount" select="count(IncludedPackages/Package)" />

      <table>
        <tr>
          <th class="issueCell">Included in project.json</th>
        </tr>
        <xsl:for-each select="IncludedPackages/Package">
          <tr>
            <td class="issueCell">
              <span>
                <xsl:value-of select="@Name" />
              </span>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:choose>
          <xsl:when test="$includedPackageCount = 0">
            <tr>
              <td class="issueCell">
                No packages were included.
              </td>
            </tr>
          </xsl:when>
        </xsl:choose>
      </table>
    </xsl:for-each>
  </xsl:template>

  <!-- Excluded Packages Template -->
  <xsl:template match="Projects" mode="ExcludedPackages">
    <xsl:for-each select="Project">
      <xsl:variable name="excludedPackageCount" select="count(ExcludedPackages/Package)" />

      <table>
        <tr>
          <th class="issueCell">Excluded from project.json</th>
        </tr>
        <xsl:for-each select="ExcludedPackages/Package">
          <tr>
            <td class="issueCell">
              <span>
                <xsl:value-of select="@Name" />
              </span>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:choose>
          <xsl:when test="$excludedPackageCount = 0">
            <tr>
              <td class="issueCell">
                No packages were excluded.
              </td>
            </tr>
          </xsl:when>
        </xsl:choose>
      </table>
    </xsl:for-each>
  </xsl:template>

  <!-- Project Details Template -->
  <xsl:template match="Projects" mode="ProjectDetails">
    <xsl:for-each select="Project">
      <xsl:variable name="issuesCount" select="count(Issues/Issue)" />

      <table>
        <tr>
          <th />
          <th class="issueCell" _locID="DescriptionTableHeader">Description</th>
        </tr>

        <xsl:for-each select="Issues/Issue">
          <xsl:sort select="@Level" order="descending" />
          <xsl:apply-templates select="." />
        </xsl:for-each>

        <xsl:choose>
          <xsl:when test="$issuesCount = 0">
            <tr>
              <td class="IconInfoEncoded" />
              <td class="issueCell">
                No issues were found.
              </td>
            </tr>
          </xsl:when>
        </xsl:choose>


      </table>
    </xsl:for-each>
  </xsl:template>

  <!-- Document, matches "NuGetUpgradeReport" -->
  <xsl:template match="NuGetUpgradeReport">
    <!-- Output doc type the 'Mark of the web' which disabled prompting to run JavaScript from local HTML Files in IE -->
    <!-- NOTE: The whitespace around the 'Mark of the web' is important it must be exact -->
    <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>
<!-- saved from url=(0014)about:internet -->
]]>
    </xsl:text>
    <html>
      <head>
        <meta content="en-us" http-equiv="Content-Language" />
        <meta content="text/html; charset=utf-16" http-equiv="Content-Type" />
        <title _locID="NuGetUpgradeReportTitle">
          NuGet Upgrade Report
        </title>
        <style>
          <xsl:text disable-output-escaping="yes">
            <![CDATA[
                    /* Body style, for the entire document */
                    body
                    {
                        background: #F3F3F4;
                        color: #1E1E1F;
                        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
                        font-size: 12pt;
                        padding: 0;
                        margin: 0;
                    }

                    /* Header1 style, used for the main title */
                    h1
                    {
                        padding: 10px 0px 10px 10px;
                        font-size: 21pt;
                        background-color: #E2E2E2;
                        border-bottom: 1px #C1C1C2 solid; 
                        color: #201F20;
                        margin: 0;
                        font-weight: normal;
                    }

                    /* Header2 style, used for "Overview" and other sections */
                    h2
                    {
                        font-size: 18pt;
                        font-weight: normal;
                        padding: 15px 0 5px 0;
                        margin: 0;
                    }

                    /* Header3 style, used for sub-sections, such as project name */
                    h3
                    {
                        font-weight: normal;
                        font-size: 15pt;
                        margin: 0;
                        padding: 15px 0 5px 0;
                        background-color: transparent;
                    }

                    .info-text
                    {
                        margin: 0px 0 0.75em 0;
                    }

                    /* Color all hyperlinks one color */
                    a
                    {
                        color: #1382CE;
                    }

                    /* Table styles */ 
                    table
                    {
                        border-spacing: 0 0;
                        border-collapse: collapse;
                        font-size: 11pt;
                    }

                    table th
                    {
                        background: #E7E7E8;
                        text-align: left;
                        text-decoration: none;
                        font-weight: normal;
                        padding: 3px 6px 3px 6px;
                    }

                    table td
                    {
                        vertical-align: top;
                        padding: 3px 6px 5px 5px;
                        margin: 0px;
                        border: 1px solid #E7E7E8;
                        background: #F7F7F8;
                    }

                    /* Local link is a style for hyperlinks that link to file:/// content, there are lots so color them as 'normal' text until the user mouse overs */
                    .localLink
                    {
                        color: #1E1E1F;
                        background: #EEEEED;
                        text-decoration: none;
                    }

                    .localLink:hover
                    {
                        color: #1382CE;
                        background: #FFFF99;
                        text-decoration: none;
                    }

                    .issueCell
                    {
                        width: 100%;
                    }

                    /* Padding around the content after the h1 */ 
                    #content 
                    {
	                    padding: 0px 20px 20px 20px; 
                    }

                    .issues table
                    {
                        width: 97%;
                    }

                    /* All Icons */
                    .IconSuccessEncoded, .IconInfoEncoded, .IconWarningEncoded, .IconErrorEncoded
                    {
                        min-width:18px;
                        min-height:18px; 
                        background-repeat:no-repeat;
                        background-position:center;
                    }

                    .IconSuccessEncoded
                    {
                        background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAA7EAAAOxAGVKw4bAAABcElEQVR4Xq2TsUsCURzHv15g8ZJcBWlyiYYgCIWcb9DFRRwMW5TA2c0/QEFwFkxxUQdxVlBwCYWOi6IhWgQhBLHJUCkhLr/BW8S7gvrAg+N+v8/v+x68Z8MGy+XSCyABQAXgBgHGALoASkIIDWSLeLBetdHryMjd5IxQPWT4rn1c/P7+xxp72Cs9m5SZ0Bq2vPnbPFafK2zDvmNHypdC0BPkLlQhxJsCAhQoZwdZU5mwxh720qGo8MzTxTTKZDPCx2HoVzp6lz0Q9tKhyx0kGs8Ny+TkWRKk8lCROwEduhyg9l/6lunOPSfmH3NUH6uQ0KHLAe7JYvJjevm+DAMGJHToKtigE+vwvIidxLamb8IBY9e+C5LiXREkfho3TSd06HJA13/oh6T51MTsfQbHrsMynQ5dDihFjiK8JJAU9AKIWTp76dCVN7HWHrajmUEGvyF9nkbAE6gLIS7kTUyuf2gscLoJrElZo/Mvj+nPz/kLTmfnEwP3tB0AAAAASUVORK5CYII=);
                    }

                    .IconInfoEncoded
                    {
                        background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHElEQVR4Xs2TsUoDQRRF7wwoziokjZUKadInhdhukR9YP8DMX1hYW+QvdsXa/QHBbcXC7W0CamWTQnclFutceIQJwwaWNLlwm5k5d94M76mmaeCrrmsLYOocY12FcxZFUeozCqKqqgYA8uevv1H6VuPxcwlfk5N92KHBxfFeCSAxxswlYAW/Xr989x/mv9gkhtyMDhcAxgzRsp7flj8B/HF1RsMXq+NZMkopaHe7lbKxQUEIGbKsYNoGn969060hZBkQex/W8oRQwsQaW2o3Ago2SVcJUzAgY3N0lTCZZm+zPS8HB51gMmS1DEYyOz9acKO1D8JWTlafKIMxdhvlfdyT94Vv5h7P8Ky7nQzACmhvKq3zk3PjW9asz9D/1oigecsioooAAAAASUVORK5CYII=);
                    }

                    .IconWarningEncoded
                    {
                        background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAx0lEQVR4XpWSMQ7CMAxFf4xAyBMLCxMrO8dhaBcuwdCJS3RJBw7SA/QGTCxdWJgiQYWKXJWKIXHIlyw5lqr34tQgEOdcBsCOx5yZK3hCCKdYXneQkh4pEfqzLfu+wVDSyyzFoJjfz9NB+pAF+eizx2Vruts0k15mPgvS6GYvpVtQhB61IB/dk6AF6fS4Ben0uIX5odtFe8Q/eW1KvFeH4e8khT6+gm5B+t3juyDt7n0jpe+CANTd+oTUjN/U3yVaABnSUjFz/gFq44JaVSCXeQAAAABJRU5ErkJggg==);
                    }

                    .IconErrorEncoded
                    {
                        background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABQElEQVR4XqWTvUoEQRCE6wYPZUA80AfwAQz23uCMjA7MDRQEIzPBVEyNTQUFIw00vcQTTMzuAh/AxEQQT8HF/3G/oGGnEUGuoNnd6qoZuqltyKEsyzVJq5I6rnUp6SjGeGhESikzzlc1eL7opfuVbrqbU1Zw9NCgtQMaZpY0eNnaaL2fHusvTK5vKu7sjSS1Y4y3QUA6K3e3Mau5UFDyMP7tYF9o8cAHZv68vipoIJg971PZIZ5HiwdvYGGvFVFHmGmZ2MxwmQYPXubPl9Up0tfoMQGetXd6mRbvhBw+boZ6WF7Mbv1+GsHRk0fQmPAH1GfmZirbCfDJ61tw3Px8/8pZsPAG4jlVhcPgZ7adwNWBB68lkRQWFiTgFlbnLY3DGGM7izIJIyT/jjIvEJw6fdJTc6krDzh6aMwMP9bvDH4ADSsa9uSWVJkAAAAASUVORK5CYII=);
                    }
                ]]>
          </xsl:text>
        </style>
      </head>
      <body>
        <h1>
          NuGet Upgrade Report - <xsl:value-of select="current()/@Name" />
        </h1>

        <div id="content">
          <h2 _locID="OverviewTitle">Overview</h2>
          <div class="info-text">Upgrade to project.json was completed successfully. Please build and run your solution to verify that all packages are available.</div>
          <div class="info-text">
            Changed files are backed up here:
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="current()/@BackupPath" />
              </xsl:attribute>
              <xsl:value-of select="current()/@BackupPath" />
            </a>
          </div>
          <div class="info-text">
            If you need to revert changes, follow the directions here:
            <a href="https://aka.ms/nugetupgraderevertv1">Reverting NuGet Project Upgrade</a>
          </div>

          <h2 _locID="PackagtesTitle">Packages Processed</h2>
          <div class="issues">
            <xsl:apply-templates select="Projects" mode="IncludedPackages" />
          </div>
          <p />
          <div class="issues">
            <xsl:apply-templates select="Projects" mode="ExcludedPackages" />
          </div>

          <h2 _locID="IssuesTitle">Issues Found</h2>
          <div class="issues">
            <xsl:apply-templates select="Projects" mode="ProjectDetails" />
          </div>

        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>