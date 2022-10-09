<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="newLabs.aspx.cs" Inherits="FindYourDoctor.Web.admin.newLabs" %>

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
                            <li class="breadcrumb-item active">New Lab</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->


            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header">
                            <h4 class="card-title">New Lab</h4>
                        </div>
                        <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Lab Name</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="LabName" runat="server">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Description</label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList runat="server" ID="specialityDDL" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Speciality" DataValueField="Id"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' SelectCommand="SELECT [Id], [Speciality] FROM [tblSpeciality] WHERE ([IsForDoctor] = @IsForDoctor)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="false" Name="IsForDoctor" Type="Boolean"></asp:Parameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Area</label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList CssClass="form-control" ID="Area" runat="server" DataSourceID="SqlDataSource1" DataTextField="AreaName" DataValueField="Id"></asp:DropDownList>
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
                                <div class="text-right">
                                    <button type="submit" class="btn btn-primary" id="submit" runat="server" onserverclick="submit_ServerClick">Submit</button>
                                </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="col-12">
                        <asp:GridView ID="labGrid" runat="server" CssClass="col-lg-12 table table-hover table-striped table-bordered table-center" AutoGenerateColumns="False" DataKeyNames="Id,Id1,Id2" DataSourceID="SqlDataSource3">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                                <asp:BoundField DataField="LabName" HeaderText="LabName" SortExpression="LabName"></asp:BoundField>
                                <%--<asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"></asp:BoundField>--%>
                                <asp:BoundField DataField="AreaName" HeaderText="AreaName" SortExpression="AreaName"></asp:BoundField>
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                                <%--<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>--%>
                                <asp:BoundField DataField="OpensAt" HeaderText="OpensAt" SortExpression="OpensAt" DataFormatString="{0:hh:mm tt}"></asp:BoundField>
                                <asp:BoundField DataField="ClosesAt" HeaderText="ClosesAt" SortExpression="ClosesAt" DataFormatString="{0:hh:mm tt}"></asp:BoundField>
                                <%--<asp:BoundField DataField="SpecialityId" HeaderText="SpecialityId" SortExpression="SpecialityId"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Id1" HeaderText="Id1" ReadOnly="True" InsertVisible="False" SortExpression="Id1"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="Id2" HeaderText="Id2" ReadOnly="True" InsertVisible="False" SortExpression="Id2"></asp:BoundField>--%>
                                <asp:BoundField DataField="Speciality" HeaderText="Speciality" SortExpression="Speciality"></asp:BoundField>
                                <%--<asp:CheckBoxField DataField="IsForDoctor" HeaderText="IsForDoctor" SortExpression="IsForDoctor"></asp:CheckBoxField>--%>
                                <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-sm bg-danger-light"></asp:CommandField>                            
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:dbDoctor %>' DeleteCommand="Delete from tblLab where Id = @id" SelectCommand="Select * from tblLab inner join tblArea on Area = tblArea.Id inner join tblSpeciality on SpecialityId = tblSpeciality.Id">
                            <DeleteParameters>
                                <asp:Parameter Name="id"></asp:Parameter>
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div style="height: 100px;"></div>
        </div>

    </div>
</asp:Content>
