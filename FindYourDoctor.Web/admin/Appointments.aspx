<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="FindYourDoctor.Web.admin.Appointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        ul li a{
            text-decoration: none;
        }
    </style>
    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <h3 class="page-title">Welcome Admin!</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active">View Appointments</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->


            <ul class="nav nav-tabs" id="tabs">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#doctors" id="#docLink">Doctors' Appointments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#labs">Labs' Appointments</a>
                </li>
            </ul>
            <div class="row">
            <div class="tab-content">
                <div id="doctors" class="tab-pane active ">
                    <h3>Doctors' Appointments</h3>
                    <div class="col-xl-12 card-body">
                        <asp:GridView ID="doctorGrid" runat="server" CssClass="col-lg-12 table table-hover table-striped table-bordered table-center" AutoGenerateColumns="False" DataKeyNames="Id,Id1,Id2" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                                <%--<asp:BoundField DataField="PatientId" HeaderText="PatientId" SortExpression="PatientId"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="DoctorId" HeaderText="DoctorId" SortExpression="DoctorId"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="LabId" HeaderText="LabId" SortExpression="LabId"></asp:BoundField>--%>
                                
                                <asp:BoundField DataField="FullName" HeaderText="Patient" SortExpression="FullName"></asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Doctor" SortExpression="Name"></asp:BoundField>
                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd-MMM-yyyy}"></asp:BoundField>
                                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" DataFormatString="{0:hh:mm tt}"></asp:BoundField>
                                <%--<asp:CheckBoxField DataField="IsCancelled" HeaderText="IsCancelled" SortExpression="IsCancelled"></asp:CheckBoxField>--%>
                                <%--<asp:BoundField DataField="Id1" HeaderText="Id1" ReadOnly="True" InsertVisible="False" SortExpression="Id1"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="SpecialityId" HeaderText="SpecialityId" SortExpression="SpecialityId"></asp:BoundField>--%>
                                <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" DataFormatString="{0:N2}"></asp:BoundField>
                                <%--<asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="StartAt" HeaderText="StartAt" SortExpression="StartAt"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="CloseAt" HeaderText="CloseAt" SortExpression="CloseAt"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Id2" HeaderText="Id2" ReadOnly="True" InsertVisible="False" SortExpression="Id2"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age"></asp:BoundField>--%>
                                <asp:ButtonField CommandName="Update" Text="Cancel" ButtonType="Button" ControlStyle-CssClass="btn btn-sm bg-danger-light"></asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' DeleteCommand="Delete from tblAppointment where Id = @id;" SelectCommand="Select * from tblAppointment Inner Join tblDoctor on DoctorId = tblDoctor.Id INNER JOIN tblPatient on PatientId = tblPatient.Id where LabId = 0 and IsCancelled = 'false';" UpdateCommand="Update tblAppointment set IsCancelled = 'true' where Id = @id;">
                            <DeleteParameters>
                                <asp:Parameter Name="id"></asp:Parameter>
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div id="labs" class="tab-pane fade">
                    <h3>Labs' Appointments</h3>

                    <div class="col-xl-12 card-body">
                        <asp:GridView ID="labGrid" runat="server" CssClass="col-lg-12 table table-hover table-striped table-bordered table-center" AutoGenerateColumns="False" DataKeyNames="Id,Id1,Id2" DataSourceID="SqlDataSource2">

                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                                <%--<asp:BoundField DataField="PatientId" HeaderText="PatientId" SortExpression="PatientId"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="DoctorId" HeaderText="DoctorId" SortExpression="DoctorId"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="LabId" HeaderText="LabId" SortExpression="LabId"></asp:BoundField>--%>
                                <asp:BoundField DataField="FullName" HeaderText="Patient" SortExpression="FullName"></asp:BoundField>
                                <asp:BoundField DataField="LabName" HeaderText="Lab" SortExpression="LabName"></asp:BoundField>
                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd-MMM-yyyy}"></asp:BoundField>
                                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" DataFormatString="{0:hh:mm tt}"></asp:BoundField>
                                <%--<asp:CheckBoxField DataField="IsCancelled" HeaderText="IsCancelled" SortExpression="IsCancelled"></asp:CheckBoxField>--%>
                                <%--<asp:BoundField DataField="Id1" HeaderText="Id1" ReadOnly="True" InsertVisible="False" SortExpression="Id1"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="OpensAt" HeaderText="OpensAt" SortExpression="OpensAt"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="ClosesAt" HeaderText="ClosesAt" SortExpression="ClosesAt"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="SpecialityId" HeaderText="SpecialityId" SortExpression="SpecialityId"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Id2" HeaderText="Id2" ReadOnly="True" InsertVisible="False" SortExpression="Id2"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age"></asp:BoundField>--%>
                                <asp:ButtonField CommandName="Update" Text="Cancel" ButtonType="Button" ControlStyle-CssClass="btn btn-sm bg-danger-light"></asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' SelectCommand="Select * from tblAppointment Inner Join tblLab on LabId = tblLab.Id INNER JOIN tblPatient on PatientId = tblPatient.Id where DoctorId = 0 and IsCancelled = 'false';" UpdateCommand="Update tblAppointment set IsCancelled = 'true' where Id = @id">
                            <UpdateParameters>
                                <asp:Parameter Name="id"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
                </div>
        </div>
    </div>
</asp:Content>
