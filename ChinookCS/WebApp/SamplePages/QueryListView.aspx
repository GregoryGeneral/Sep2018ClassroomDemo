﻿<%@ Page Title="Query ListView" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QueryListView.aspx.cs" Inherits="WebApp.SamplePages.QueryListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>ODS Query (ListView)</h1>
    <asp:Label ID="Label1" runat="server" Text="Select an artist"></asp:Label>
    <asp:DropDownList ID="ArtistList" runat="server"
        DataSourceID="ArtistListODS"
        DataTextField="Name"
        DataValueField="ArtistId"
        AppendDataBoundItems="true">

        <asp:ListItem Value="0">Select ...</asp:ListItem>
    </asp:DropDownList>
    <asp:LinkButton ID="FetchArtist" runat="server">Fetch</asp:LinkButton>
    <br />
    <br />

    <asp:ListView ID="AlbumList" runat="server" DataSourceID="AlbumListODS">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Label Text='<%# Eval("AlbumID") %>' runat="server" ID="AlbumIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ArtistID") %>' runat="server" ID="ArtistIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ReleaseYear") %>' runat="server" ID="ReleaseYearLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ReleaseLabel") %>' runat="server" ID="ReleaseLabelLabel" /></td>
                
                <asp:DropDownList ID="AlbumArtistList" runat="server" DataSourceID="ArtistListODS" DataTextField="Name" DataValueField="ArtistId" selectedvalue='<%# Eval("ArtistID") %>'>

                </asp:DropDownList>
                
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Label Text='<%# Eval("AlbumID") %>' runat="server" ID="AlbumIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ArtistID") %>' runat="server" ID="ArtistIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ReleaseYear") %>' runat="server" ID="ReleaseYearLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ReleaseLabel") %>' runat="server" ID="ReleaseLabelLabel" /></td>
            </tr>
        </ItemTemplate>

        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server">AlbumID</th>
                                <th runat="server">Title</th>
                                <th runat="server">ArtistID</th>
                                <th runat="server">ReleaseYear</th>
                                <th runat="server">ReleaseLabel</th>
                              
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>

                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="ArtistListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Artist_List" TypeName="ChinookSystem.BLL.ArtistController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="AlbumListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Album_GetByArtistId" TypeName="ChinookSystem.BLL.AlbumController"></asp:ObjectDataSource>
</asp:Content>
