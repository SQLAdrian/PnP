<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@Register Tagprefix="PageFieldTaxonomyFieldControl" Namespace="Microsoft.SharePoint.Taxonomy" Assembly="Microsoft.SharePoint.Taxonomy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldRadioButtonChoiceField" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldUserField" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldDateTimeField" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldPublishingScheduleFieldControl" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldBooleanField" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>

<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
	<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>
	
	<!-- Custom styles are loaded only on display mode -->
    <PublishingWebControls:EditModePanel runat="server" id="DisplayModeControl" SuppressTag="true" PageDisplayMode="display">
        <SharePointWebControls:CssRegistration runat="server" ID="PortalCss" Name="&lt;% $SPUrl:~sitecollection/Style Library/PnP/layouts.css %&gt;" After="corev15.css"/>
	</PublishingWebControls:EditModePanel>

	<PublishingWebControls:EditModePanel runat="server">
		<!-- Styles for edit mode only-->
		<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css %>"
			After="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>
					
		<!-- Custom styles are loaded only on edit mode -->
	    <SharePointWebControls:CssRegistration runat="server" ID="PortalLayoutEditCss" Name="&lt;% $SPUrl:~sitecollection/Style Library/PnP/layouts-edit.css %&gt;" After="corev15.css"/>	
			
	</PublishingWebControls:EditModePanel>
	<SharePointWebControls:FieldValue id="PageStylesField" FieldName="HeaderStyleDefinitions" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitle" runat="server">
	<SharePointWebControls:FieldValue id="PageTitle" FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitleInTitleArea" runat="server">
	<SharePointWebControls:FieldValue FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleBreadcrumb" runat="server"> 
	<SharePointWebControls:ListSiteMapPath runat="server" SiteMapProviders="CurrentNavigationSwitchableProvider" RenderCurrentNodeAsLink="false" PathSeparator="" CssClass="s4-breadcrumb" NodeStyle-CssClass="s4-breadcrumbNode" CurrentNodeStyle-CssClass="s4-breadcrumbCurrentNode" RootNodeStyle-CssClass="s4-breadcrumbRootNode" NodeImageOffsetX=0 NodeImageOffsetY=289 NodeImageWidth=16 NodeImageHeight=16 NodeImageUrl="/_layouts/15/images/fgimg.png?rev=33" HideInteriorRootNodes="true" SkipLinkText=""/> </asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">

<div class="page-layout">
	<div class="row">
			<div class="col-md-12">
			
				<PublishingWebControls:EditModePanel runat="server" SuppressTag="true" PageDisplayMode="display">
					<div id="title" class="field">
						<SharePointWebControls:TextField runat="server" FieldName="Title"/>
					</div>

					<div class="promoted-actions hidden-md hidden-lg">
						<!-- Share + Follow -->
						<SharePointWebControls:SPSharePromotedActionButton runat="server"/>
						<SharePointWebControls:DelegateControl runat="server" ControlId="PromotedActions" AllowMultipleControls="true" />
					</div>
					
				</PublishingWebControls:EditModePanel>
        
                <PublishingWebControls:EditModePanel runat="server" SuppressTag="true" PageDisplayMode="display">
                	<div class="line">
                	    <component-pageinfo params='selectedFields: ["StartDate","OData__EndDate","Location"], expandedFields: [""]'></component-pageinfo>
                	</div>
                	<div class="line">
                		<component-icsgenerator params='eventItemId: _spPageContextInfo.pageItemId'></component-icsgenerator>
                	</div>
                </PublishingWebControls:EditModePanel>
			
				<PublishingWebControls:EditModePanel runat="server" CssClass="edit-mode-panel title-edit">

					<div id="title" class="field">
						<SharePointWebControls:TextField runat="server" FieldName="Title"/>
					</div>				               
    
                    <div id="start-date" class="field">
                        <PageFieldDateTimeField:DateTimeField FieldName="StartDate" runat="server"/>
                    </div>

                    <div id="end-date" class="field">
                        <PageFieldDateTimeField:DateTimeField FieldName="_EndDate" runat="server"/>
                    </div>

                    <div id="location" class="field">
                        <SharePointWebControls:TextField FieldName="Location" runat="server"/>
                    </div>
                    
                    <div id="contact" class="field">
						<PageFieldUserField:UserField FieldName="IntranetContact" runat="server"/>    
					</div>
                
                    <div class="edit-panel">
                    
                        <div id="publishing-start-date" class="field">
                            <PageFieldPublishingScheduleFieldControl:PublishingScheduleFieldControl FieldName="PublishingStartDate" runat="server"/>
                        </div>

                        <div id="publishing-expiration-date" class="field">
                            <PageFieldPublishingScheduleFieldControl:PublishingScheduleFieldControl FieldName="PublishingExpirationDate" runat="server"/>
                        </div>

                        <div id="tags" class="field">
                            <PageFieldTaxonomyFieldControl:TaxonomyFieldControl FieldName="IntranetKeywords" runat="server"/>
                        </div>

                        <div id="language" class="field">
                            <PageFieldRadioButtonChoiceField:RadioButtonChoiceField FieldName="IntranetContentLanguage" runat="server"/>
                        </div>

                        <div id="translation" class="field">
                            <component-translationcontrol params='languageFieldName:"IntranetContentLanguage", associationKeyFieldName:"IntranetContentAssociationKey"'></component-translationcontrol>
                        </div>

						<div id="hide-side-bar" class="field">
                            <PageFieldBooleanField:BooleanField FieldName="HideSideBar" runat="server"/>
                            <SharePointWebControls:FieldProperty FieldName="HideSideBar" PropertyName="Description" runat="server" />
                        </div>
                        
                    </div>
	                    
				</PublishingWebControls:EditModePanel>
                	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
                <div id="page-image" class="field">
                    <PublishingWebControls:RichImageField FieldName="PublishingPageImage" runat="server"/>
                </div>
            </div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="article-content">
					<PublishingWebControls:RichHtmlField FieldName="PublishingPageContent" HasInitialFocus="True" MinimumEditHeight="400px" runat="server" PrefixStyleSheet="intranet"/>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
