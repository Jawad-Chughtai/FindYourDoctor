<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="PatientProfile.aspx.cs" Inherits="FindYourDoctor.Web.PatientProfile" %>

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
                            <li class="breadcrumb-item active" aria-current="page">Patient Profile</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- /Breadcrumb -->
    <div class="row mt-5">
        <div class="col-12 text-center mb-2">
            <h2 class="text-primary">Doctor Appointments</h2>
        </div>

        <div class="col-lg-12">
            <div class="table-responsive col-12 text-center">
                <asp:GridView CssClass="col-lg-9 table table-hover table-striped table-bordered table-center" ID="doctorAppointments" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Doctor Name" SortExpression="Name"></asp:BoundField>
                        <asp:BoundField DataField="Speciality" HeaderText="Speciality" SortExpression="Speciality"></asp:BoundField>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd-MMM-yyyy}"></asp:BoundField>
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" DataFormatString="{0:t}"></asp:BoundField>
                        <asp:BoundField DataField="AreaName" HeaderText="Area" SortExpression="AreaName"></asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                        <asp:ButtonField CommandName="Update" Text="Cancel" ButtonType="Button" ControlStyle-CssClass=" btn-success btn-md"></asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' 
                    SelectCommand="select a.Id, a.[Date], a.[Time], d.[Name], d.Speciality, tblArea.AreaName, d.City
                                from 
                                tblAppointment as a
                                inner join tblDoctor as d
                                on a.DoctorId = d.Id
                                inner join tblArea
                                on d.Area = tblArea.Id
                                where a.DoctorId != 0 and a.IsCancelled = 'false'
                                order by a.Id DESC"
                                UpdateCommand="update [tblAppointment] set [IsCancelled] = 'true' where ([Id] = @Id)">
                    <UpdateParameters>
                        <asp:Parameter Name="Id"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

    <div class="row mt-5 mb-5">
        <div class="col-12 text-center mb-2">
            <h2 class="text-primary">Lab Appointments</h2>
        </div>

        <div class="col-lg-12">
            <div class="table-responsive col-12 text-center">
                <asp:GridView ID="LabAppointments" runat="server" CssClass="col-lg-9 table table-hover table-striped table-bordered table-center" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                        <asp:BoundField DataField="LabName" HeaderText="LabName" SortExpression="LabName"></asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" SortExpression="Date"></asp:BoundField>
                        <asp:BoundField DataField="Time" DataFormatString="{0:t}" HeaderText="Time" SortExpression="Time"></asp:BoundField>
                        <asp:BoundField DataField="AreaName" HeaderText="AreaName" SortExpression="AreaName"></asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                        <asp:ButtonField CommandName="Update" Text="Cancel" ButtonType="Button" ControlStyle-CssClass=" btn-success btn-md"></asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' 
                    SelectCommand="select a.Id, a.[Date], a.[Time], d.[LabName], tblArea.AreaName, d.City
                                    from 
                                    tblAppointment as a
                                    inner join tblLab as d
                                    on a.LabId = d.Id
                                    inner join tblArea
                                    on d.Area = tblArea.Id
                                    where a.LabId != 0 and a.IsCancelled = 'false'
                                    order by a.Id DESC"
                                    UpdateCommand="update [tblAppointment] set [IsCancelled] = 'true' where ([Id] = @Id)"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
