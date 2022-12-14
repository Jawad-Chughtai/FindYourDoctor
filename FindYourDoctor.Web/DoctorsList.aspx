<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="DoctorsList.aspx.cs" Inherits="FindYourDoctor.Web.DoctorsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Breadcrumb -->
    <div class="breadcrumb-bar">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-8 col-12">
                    <nav aria-label="breadcrumb" class="page-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Doctors List</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- /Breadcrumb -->


    <!-- Page Content -->
    <div class="content" style="min-height: 100vh;">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">

                    <!-- Search Filter -->
                    <div class="card search-filter">
                        <div class="card-header">
                            <h4 class="card-title mb-0">Search Filter</h4>
                        </div>
                        <div class="card-body">
                            <div class="filter-widget">
                                <h4>Area</h4>
                                <div>
                                    <asp:DropDownList CssClass="form-control" ID="area" runat="server" DataSourceID="SqlDataSource1" DataTextField="AreaName" DataValueField="Id"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' SelectCommand="select * from tblArea order by AreaName ASC"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="btn-search">
                                <button type="button" class="btn btn-block" id="search" runat="server" onserverclick="search_ServerClick">Search</button>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <div class="filter-widget">

                                <h4>Speciality</h4>
                                <div>
                                    <asp:DropDownList CssClass="form-control" ID="specialityDDl" runat="server" DataSourceID="SqlDataSource3" DataTextField="Speciality" DataValueField="Id"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' SelectCommand="SELECT [Id], [Speciality] FROM [tblSpeciality] WHERE ([IsForDoctor] = @IsForDoctor) ORDER BY [Speciality]">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="true" Name="IsForDoctor" Type="Boolean"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="btn-search">
                                <button type="button" class="btn btn-block" id="speciality" runat="server" onserverclick="speciality_ServerClick">Search</button>
                            </div>

                        </div>

                    </div>
                    <!-- /Search Filter -->

                </div>

                <div class="col-md-12 col-lg-8 col-xl-9">
                    <div id="doctors" runat="server">
                        
                    <!-- Doctor Widget -->
                    <!-- /Doctor Widget -->
                    </div>

                </div>
            </div>

        </div>

    </div>
    <!-- /Page Content -->


</asp:Content>
