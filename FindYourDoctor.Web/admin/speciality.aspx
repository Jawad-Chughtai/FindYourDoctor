<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="speciality.aspx.cs" Inherits="FindYourDoctor.Web.admin.speciality" %>

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
                            <li class="breadcrumb-item active">New Speciality</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->


            <div class="row">
                <div class="col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header">
                            <h4 class="card-title">Doctor Speciality</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Name</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" id="forDoctor" runat="server">
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" class="btn btn-primary" id="btnSubmitDoctor" runat="server" onserverclick="btnSubmitDoctor_ServerClick">Submit</button>
                            </div>
                            <div class="text-center mt-5">
                                <asp:GridView ID="doctorGrid" HeaderStyle-BackColor="DeepSkyBlue" HeaderStyle-ForeColor="White" CssClass="col-lg-9 table table-hover table-striped table-bordered table-center" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id" HeaderStyle-Width="50px"></asp:BoundField>
                                        <asp:BoundField DataField="Speciality" HeaderText="Speciality" SortExpression="Speciality"></asp:BoundField>
                                        <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-sm bg-danger-light" HeaderStyle-Width="50px"></asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' SelectCommand="Select Id, Speciality from tblSpeciality where IsForDoctor = 'true'" DeleteCommand="Delete from tblSpeciality where Id = @Id;">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id"></asp:Parameter>
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header">
                            <h4 class="card-title">Lab Speciality</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Name</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" id="forLab" runat="server">
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" class="btn btn-primary" id="btnSubmitLab" runat="server" onserverclick="btnSubmitLab_ServerClick">Submit</button>
                            </div>
                            
                            <div class="text-center mt-5">

                                <asp:GridView ID="labGrid" runat="server" HeaderStyle-BackColor="DeepSkyBlue" HeaderStyle-ForeColor="White" CssClass="col-lg-9 table table-hover table-striped table-bordered table-center" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">

                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id" HeaderStyle-Width="50px"></asp:BoundField>
                                        <asp:BoundField DataField="Speciality" HeaderText="Speciality" SortExpression="Speciality"></asp:BoundField>
                                        <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-sm bg-danger-light" HeaderStyle-Width="50px"></asp:CommandField>
                                    </Columns>

                                </asp:GridView>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' DeleteCommand="Delete from tblSpeciality where Id = @id" SelectCommand="Select Id, Speciality from tblSpeciality where IsForDoctor = 'false';">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id"></asp:Parameter>
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
