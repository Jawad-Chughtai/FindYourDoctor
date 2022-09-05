<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FindYourDoctor.Web.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					
					<div class="row">
						<div class="col-md-8 offset-md-2">
								
							<!-- Register Content -->
							<div class="account-content">
								<div class="row align-items-center justify-content-center">
									<div class="col-md-7 col-lg-6 login-left">
										<img src="assets/img/login-banner.png" class="img-fluid" alt="Doccure Register">	
									</div>
									<div class="col-md-12 col-lg-6 login-right">
										<div class="login-header">
											<h3>Patient Register</h3>
										</div>
										
										<!-- Register Form -->
										<div>
											<div class="form-group form-focus">
												<input type="text" class="form-control floating" id="fullName" runat="server">
												<label class="focus-label">Full Name</label>
											</div>
											<div class="form-group form-focus">
												<input type="email" class="form-control floating" id="email" runat="server">
												<label class="focus-label">Email</label>
											</div>
											<div class="form-group form-focus">
												<input type="password" class="form-control floating" id="password" runat="server">
												<label class="focus-label">Create Password</label>
											</div>
											<div class="form-group form-focus">
												<input type="text" class="form-control floating" id="contact" runat="server">
												<label class="focus-label">Contact</label>
											</div>
											<div class="form-group form-focus">
												<input type="number" class="form-control floating" id="age" runat="server">
												<label class="focus-label">Age</label>
											</div>
											<div class="text-right">
												<a class="forgot-link" href="login.aspx">Already have an account?</a>
											</div>
											<button class="btn btn-primary btn-block btn-lg login-btn" type="submit" id="submit" runat="server" onserverclick="submit_ServerClick">Signup</button>
											<div class="login-or">
												<span class="or-line"></span>
											</div>
										</div>
										<!-- /Register Form -->
										
									</div>
								</div>
							</div>
							<!-- /Register Content -->
								
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->
   
</asp:Content>
