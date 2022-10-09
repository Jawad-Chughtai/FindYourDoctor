<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="FindYourDoctor.Web.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Breadcrumb -->
    <div class="breadcrumb-bar">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-12 col-12">
                    <nav aria-label="breadcrumb" class="page-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Booking</li>
                        </ol>
                    </nav>
                    <h2 class="breadcrumb-title">Booking</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- /Breadcrumb -->

    <!-- Page Content -->
    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-12">
                    <div id="Details" runat="server">

                    </div>

                    <!-- Schedule Widget -->
                    <div class="card booking-schedule schedule-widget">

                        <!-- Schedule Header -->
                        <div class="schedule-header">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="date" class="form-control" id="date" runat="server" />
                                    <span style="color:red" id="dateError" runat="server"></span>
                                </div>
                                <div class="col-md-6">
                                    <input type="time" class="form-control" id="time" runat="server" min="<%= opensAt %>" max="<%= closesAt %>" />
                                    <span style="color:red" id="timeError" runat="server"></span>
                                </div>

                            </div>
                        </div>
                        <!-- /Schedule Header -->
                    </div>
                    <!-- /Schedule Widget -->

                    <!-- Submit Section -->
                    <div class="submit-section proceed-btn text-right">
                        <button type="submit" class="btn btn-primary submit-btn" id="submit" runat="server" onserverclick="submit_ServerClick">Book Now</button>
                    </div>
                    <!-- /Submit Section -->

                </div>
            </div>
        </div>

    </div>

    <!-- /Page Content -->

</asp:Content>
