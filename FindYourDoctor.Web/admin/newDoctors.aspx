﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="newDoctors.aspx.cs" Inherits="FindYourDoctor.Web.admin.newDoctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <h3 class="page-title">Welcome Admin!</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active">New Doctor</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->


            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header">
                            <h4 class="card-title">New Doctor</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Doctor Name</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" id="name" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Description</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" id="description" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Area</label>
                                <div class="col-lg-9">
                                    <asp:DropDownList ID="area" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="AreaName" DataValueField="Id"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' SelectCommand="SELECT [Id], [AreaName] FROM [tblArea] ORDER BY AreaName ASC"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">City</label>
                                <div class="col-lg-9">
                                    <input type="text" disabled="disabled" class="form-control" value="Muzaffarabad" id="city" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Opens At</label>
                                <div class="col-lg-9">
                                    <input type="time" class="form-control" id="opens" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Closes At</label>
                                <div class="col-lg-9">
                                    <input type="time" class="form-control" id="closes" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Speciality</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" id="speciality" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Fee</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" id="fee" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Gender</label>
                                <div class="col-lg-9">
                                    <asp:DropDownList CssClass="form-control" ID="gender" runat="server">
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" class="btn btn-primary" id="submit" runat="server" onserverclick="submit_ServerClick">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>