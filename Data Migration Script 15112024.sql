IF NOT EXISTS(SELECT 1 FROM dbo.tbl_esg_OrganizationGroupSector)
BEGIN
        MERGE INTO dbo.tbl_esg_OrganizationGroupSector AS Target
        USING (VALUES
        (1, 'Business and Professional Services', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2, 'Consumer Goods and Retail', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (3, 'Creative and Design', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (4, 'Education and Research', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (5, 'Energy and Environmental Services', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (6, 'Financial Services', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (7, 'Food and Agriculture', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (8, 'Government and Public Sector', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (9, 'Health and Wellness', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (10, 'Hospitality and Leisure', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (11, 'Legal and Compliance', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (12, 'Logistics and Transportation', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (13, 'Manufacturing and Construction', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (14, 'Media and Entertainment', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (15, 'Real Estate and Construction', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (16, 'Technology and Engineering', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (17, 'Other', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL)
        ) AS Source (OrganizationGroupSectorId, OrganizationGroupSectorName, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.OrganizationGroupSectorId = Target.OrganizationGroupSectorId
        --WHEN MATCHED THEN
        --    UPDATE SET Target.OrganizationGroupSectorName = Source.OrganizationGroupSectorName
        --    , Target.CreatedBy = Source.CreatedBy 
        --    , Target.CreatedDate = Source.CreatedDate
        --    , Target.ModifiedBy = Source.ModifiedBy
        --    , Target.ModifiedDate = Source.ModifiedDate
        WHEN NOT MATCHED THEN
            INSERT (OrganizationGroupSectorId, OrganizationGroupSectorName, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.OrganizationGroupSectorId, Source.OrganizationGroupSectorName, Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

END

IF 1 = 1--NOT EXISTS(SELECT 1 FROM dbo.OrganizationSector)
BEGIN
        
        
        -- Enable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_OrganizationSector ON;

        MERGE INTO dbo.tbl_esg_OrganizationSector AS Target
        USING (VALUES
        (1, 'Agriculture and Fishing', 6, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2, 'Accommodation and Food Services Activities',12, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (3, 'Administrative and Support Service Activities',11, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (4, 'Arts, Entertainment and Recreation',9, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (5, 'Activities of Households as Employers of Domestic Personnel',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (6, 'Construction',2, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (7, 'Electricity, Gas, Steam and Air-Conditioning Supply',15, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (8, 'Education',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (9, 'Financial and Insurance Activities',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (10, 'Health and Social Services',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (11, 'Information and Communications',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (12, 'Mining and Quarrying',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (13, 'Manufacturing',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (14, 'Other Service Activities',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (15, 'Professional, Scientific and Technical Activities',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (16, 'Real Estate Activities',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (17, 'Transportation and Storage',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (18, 'Water Supply; Sewage, Waste Management and Remediation Activities',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (19, 'Wholesale and Retail Trade',14, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL)
      
        ) AS Source (OrganizationSectorId, OrganizationSectorName,OrganizationGroupSectorId, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.OrganizationSectorId = Target.OrganizationSectorId
        WHEN MATCHED THEN
            UPDATE SET Target.OrganizationSectorName = Source.OrganizationSectorName
            , Target.OrganizationGroupSectorId = Source.OrganizationGroupSectorId
            , Target.CreatedBy = Source.CreatedBy 
            , Target.CreatedDate = Source.CreatedDate
            , Target.ModifiedBy = Source.ModifiedBy
            , Target.ModifiedDate = Source.ModifiedDate
        WHEN NOT MATCHED THEN
            INSERT (OrganizationSectorId, OrganizationSectorName, OrganizationGroupSectorId, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.OrganizationSectorId, Source.OrganizationSectorName, Source.OrganizationGroupSectorId, Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

        -- Disable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_OrganizationSector OFF;
END


IF NOT EXISTS (SELECT 1 FROM dbo.tbl_esg_CompanyTurnover)
BEGIN
        -- Enable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_CompanyTurnover ON;

        MERGE INTO dbo.tbl_esg_CompanyTurnover AS Target
        USING (VALUES
        (1, 'Less than S$1 million', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2, 'S$1 million to <S$20 million', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (3, 'S$20 million to <S$50 million', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (4, 'S$50 million to <=S$100 million', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (5, 'More than S$100 million', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL)
        ) AS Source (CompanyTurnoverId, CompanyTurnoverName, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.CompanyTurnoverId = Target.CompanyTurnoverId
        --WHEN MATCHED THEN
        --    UPDATE SET Target.CompanyTurnoverName = Source.CompanyTurnoverName
        --    , Target.CreatedBy = Source.CreatedBy 
        --    , Target.CreatedDate = Source.CreatedDate
        --    , Target.ModifiedBy = Source.ModifiedBy
        --    , Target.ModifiedDate = Source.ModifiedDate
        WHEN NOT MATCHED THEN
            INSERT (CompanyTurnoverId, CompanyTurnoverName, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.CompanyTurnoverId, Source.CompanyTurnoverName, Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

        -- Disable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_CompanyTurnover OFF;
END



IF NOT EXISTS (SELECT 1 FROM dbo.tbl_esg_Pillar)
BEGIN
        -- Enable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_Pillar ON;

        MERGE INTO dbo.tbl_esg_Pillar AS Target
        USING (VALUES
        (1, 'Governance', 'Leadership and Governance', '',0.25, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2, 'Strategy', 'Strategy and Objective Setting', '',0.25, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (3, 'Risk Management', 'Risk and Opportunity Management', '',0.25, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (4, 'Metrics, Targets & Reporting', 'Performance Monitoring and Reporting', '',0.25, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL)
        ) AS Source (PillarId, PillarTitle, PillarName, PillarImage,Weightage, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.PillarId = Target.PillarId
        WHEN MATCHED THEN
            UPDATE SET Target.PillarTitle = Source.PillarTitle
            , Target.PillarName = Source.PillarName 
            , Target.PillarImage = Source.PillarImage 
            , Target.Weightage = Source.Weightage
            , Target.CreatedBy = Source.CreatedBy 
            , Target.CreatedDate = Source.CreatedDate
            , Target.ModifiedBy = Source.ModifiedBy
            , Target.ModifiedDate = Source.ModifiedDate
        WHEN NOT MATCHED THEN
            INSERT (PillarId, PillarTitle, PillarName, PillarImage, Weightage, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.PillarId, Source.PillarTitle, Source.PillarName, Source.PillarImage, Source.Weightage, Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

        -- Disable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_Pillar OFF;
END


IF NOT EXISTS (SELECT 1 FROM dbo.tbl_esg_QuestionsType)
BEGIN
        -- Enable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_QuestionsType ON;

        MERGE INTO dbo.tbl_esg_QuestionsType AS Target
        USING (VALUES
        (1, 'Single Choice', '', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2, 'Multiple Choice', '', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (3, 'Rating', '', NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL)
        ) AS Source (QuestionsTypeId, QuestionsTypeName, QuestionsDesc, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.QuestionsTypeId = Target.QuestionsTypeId
        WHEN MATCHED THEN
            UPDATE SET Target.QuestionsTypeName = Source.QuestionsTypeName
            , Target.QuestionsDesc = Source.QuestionsDesc 
            , Target.CreatedBy = Source.CreatedBy 
            , Target.CreatedDate = Source.CreatedDate
            , Target.ModifiedBy = Source.ModifiedBy
            , Target.ModifiedDate = Source.ModifiedDate
        WHEN NOT MATCHED THEN
            INSERT (QuestionsTypeId, QuestionsTypeName, QuestionsDesc, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.QuestionsTypeId, Source.QuestionsTypeName, Source.QuestionsDesc, Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

        -- Disable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_QuestionsType OFF;
END


IF NOT EXISTS (SELECT 1 FROM dbo.tbl_esg_PredefinedAnswers)
BEGIN
        -- Enable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_PredefinedAnswers ON;

        MERGE INTO dbo.tbl_esg_PredefinedAnswers AS Target
        USING (VALUES
        (1, 1, 'Yes', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2, 1, 'No', 2, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL)
        ) AS Source (PredefinedAnswersId, QuestionsTypeId, AnswerText, DisplayOrder, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.PredefinedAnswersId = Target.PredefinedAnswersId
        WHEN MATCHED THEN
            UPDATE SET Target.QuestionsTypeId = Source.QuestionsTypeId
            , Target.AnswerText = Source.AnswerText 
            , Target.DisplayOrder = Source.DisplayOrder 
            , Target.CreatedBy = Source.CreatedBy 
            , Target.CreatedDate = Source.CreatedDate
            , Target.ModifiedBy = Source.ModifiedBy
            , Target.ModifiedDate = Source.ModifiedDate
        WHEN NOT MATCHED THEN
            INSERT (PredefinedAnswersId, QuestionsTypeId, AnswerText, DisplayOrder, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.PredefinedAnswersId, Source.QuestionsTypeId, Source.AnswerText, Source.DisplayOrder, Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

        -- Disable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_PredefinedAnswers OFF;
END




IF 1=1
BEGIN
        -- Enable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_Questions ON;

        MERGE INTO dbo.tbl_esg_Questions AS Target
        USING (VALUES
        (1, 'Has your company formally approved and publicly disclosed an official sustainability policy?', N'An official sustainability policy, in alignment with ISSB standards, is a formally sanctioned document that articulates a company''s commitment to sustainability. It outlines strategies for addressing ESG issues, emphasising transparent disclosure and accountability to guide the organisation towards sustainable development.', '', 1,1,1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2, 'Is sustainability consistently included as an agenda item in your Board or Leadership meetings?', '', '', 1,1,2,NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (3, 'Does your company appoint senior executives to manage sustainability-related issues and opportunities?', N'Within the context of ISSB standards, when referring to senior executives'' roles in overseeing sustainability-related issues and opportunities, it points to those individuals in leadership positions who have strategic oversight and decision-making authority regarding an organisation''s sustainability commitments, practices, and reporting.', '', 1,1,3,NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (4, 'Does your company conduct at least quarterly stakeholder engagements to discuss and address sustainability-related matters?', N'In the ISSB context, sustainability matters encompass ESG issues crucial for financial stability and value creation, including environmental protection (climate change, biodiversity), social responsibilities (human rights, labour practices), and governance (corporate ethics, risk management). Effective management and transparent reporting of these aspects, as emphasised by the ISSB, are essential for sustainable development and informed stakeholder decisions.', '', 1,1,4,NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),

        (5, 'Does your company have a detailed plan for executing sustainability initiatives and achieving sustainability-related targets, including greenhouse gas emissions targets?', '', '', 2,1,1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (6, 'Has your company developed a strategy to manage sustainability-related risks and opportunities?',N'The ISSB aligns its conceptual framework with broad sustainability and ESG considerations, and how it can affect a company''s value. Sustainability-related risks (e.g. environmental degradation, social injustice, governance shortfalls) are seen as potential detractors from organisational value. Conversely, sustainability-related opportunities (e.g. innovations, market expansions, operational efficiencies) are recognised as avenues for competitive advantage and value creation.', '', 2,1,2, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (7, 'Has your company secured sustainable financing to support your sustainability initiatives and projects?','', '', 2,1,3, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (8, 'Does your company collaborate with industry peers to further sustainability efforts?','', '', 2,1,4, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),

        (9, 'Have members of your management team undergone training in sustainability practises relevant to your industry?',N'Sustainability trainings include reporting, risk management, and incorporating sustainability into financial decisions.', '', 3,1,1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (10, 'Has your company pinpointed and evaluated the sustainability-related risks and opportunities that are essential to your business?','', '', 3,1,2, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (11, 'Does your company have processes and policies for identifying, assessing, prioritising, and monitoring sustainability-related risks?','', '', 3,1,3, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (12, 'Has your company engaged with key stakeholders to understand their priorities and concerns regarding sustainability?','', '', 3,1,4, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),

        (13, 'Has your company established key sustainability performance indicators?',N'Sustainability performance indicators include greenhouse gas emissions, fuel consumption, electricity usage, diversity, occupational health and safety, and business ethics.', '', 4,1,1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (14, 'Has your company established specific targets related to these sustainability performance indicators?','', '', 4,1,2, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (15, 'Does your company publicly disclose sustainability performance data and targets, for instance, through a sustainability report?','', '', 4,1,3, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (16, 'Is your sustainability report internally and/or externally verified?','', '', 4,1,4, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (17, 'Has your company obtained any sustainability management certifications, such as ISO 14001 or equivalent standards?','', '', 4,1,5, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL)

        ) AS Source (QuestionsId, QuestionsName, Guideline, QuestionsImage, PillarId, QuestionsTypeId, DisplayOrder, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.QuestionsId = Target.QuestionsId
        WHEN MATCHED THEN
            UPDATE SET Target.QuestionsName = Source.QuestionsName
            , Target.Guideline = Source.Guideline
            , Target.QuestionsImage = Source.QuestionsImage 
            , Target.PillarId = Source.PillarId 
            , Target.QuestionsTypeId = Source.QuestionsTypeId
            , Target.DisplayOrder = Source.DisplayOrder
            , Target.CreatedBy = Source.CreatedBy 
            , Target.CreatedDate = Source.CreatedDate
            , Target.ModifiedBy = Source.ModifiedBy
            , Target.ModifiedDate = Source.ModifiedDate
        WHEN NOT MATCHED THEN
            INSERT (QuestionsId, QuestionsName, Guideline, QuestionsImage, PillarId, QuestionsTypeId, DisplayOrder, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.QuestionsId, Source.QuestionsName, Source.Guideline, Source.QuestionsImage, Source.PillarId, Source.QuestionsTypeId, Source.DisplayOrder, Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

        -- Disable IDENTITY_INSERT for the Shop table
        SET IDENTITY_INSERT dbo.tbl_esg_Questions OFF;

END


IF NOT EXISTS (SELECT 1 FROM dbo.[tbl_esg_User])
BEGIN
     DECLARE @User TABLE([FullName] NVARCHAR(50),[Uname] NVARCHAR (50) NOT NULL,[Upassword] NVARCHAR (MAX) NOT NULL,[PasswordSalt] NVARCHAR (250) NOT NULL, [IsFirstLogin] BIT);

     INSERT INTO @User([FullName],[Uname],[Upassword],[PasswordSalt], [IsFirstLogin]) VALUES('Super Admin','superadmin','$2a$12$jGW7G9uPLlzH3nMb.NKueOcJm/bovj9LWSrBmxeeXDCVm3EOlp0r.','$2a$12$jGW7G9uPLlzH3nMb.NKueO', 1);
	 INSERT INTO @User([FullName],[Uname],[Upassword],[PasswordSalt], [IsFirstLogin]) VALUES('Admin1','admin1','$2a$12$jGW7G9uPLlzH3nMb.NKueOcJm/bovj9LWSrBmxeeXDCVm3EOlp0r.','$2a$12$jGW7G9uPLlzH3nMb.NKueO', 1);
	 INSERT INTO @User([FullName],[Uname],[Upassword],[PasswordSalt], [IsFirstLogin]) VALUES('Admin2','admin2','$2a$12$jGW7G9uPLlzH3nMb.NKueOcJm/bovj9LWSrBmxeeXDCVm3EOlp0r.','$2a$12$jGW7G9uPLlzH3nMb.NKueO', 1);
	 INSERT INTO @User([FullName],[Uname],[Upassword],[PasswordSalt], [IsFirstLogin]) VALUES('Admin3','admin3','$2a$12$jGW7G9uPLlzH3nMb.NKueOcJm/bovj9LWSrBmxeeXDCVm3EOlp0r.','$2a$12$jGW7G9uPLlzH3nMb.NKueO', 1);
     
     MERGE INTO dbo.[tbl_esg_User] AS Target
     USING @User AS Source 
     ON Source.[Uname]=Target.[Uname]
     WHEN NOT MATCHED THEN
     INSERT([FullName],[Uname],[Upassword],[PasswordSalt], [IsFirstLogin]) 
     VALUES(Source.FullName,Source.Uname,Source.Upassword,Source.PasswordSalt, Source.IsFirstLogin);
END


DECLARE @Role TABLE([Name] NVARCHAR(50));

INSERT INTO @Role([Name]) VALUES('Super Admin');

MERGE INTO tbl_esg_Role AS Target
USING @Role AS Source 
ON Source.Name=Target.Name
WHEN MATCHED THEN
UPDATE SET Target.Name=Source.Name
WHEN NOT MATCHED THEN
INSERT(Name) VALUES(Source.Name);


DECLARE @Module TABLE([ModuleId] INT,[Name] NVARCHAR(50), [ParentId] INT,[MenuTypeId] INT,
                      [MenuUrl]  NVARCHAR(50),[MenuIcon] NVARCHAR(50),[MenuSort] INT);

INSERT INTO @Module([ModuleId],[Name],[ParentId],[MenuTypeId],
                    [MenuUrl],[MenuIcon],[MenuSort])
                                 VALUES(1,'Questionaire',NULL,1,'/admin-questionaire','bi bi-grid',1),
                                       (2,'Survey Response',NULL,1,'/admin-surveyresponse','bi bi-grid',2)
                                     

MERGE INTO dbo.tbl_esg_Module AS Target
USING @Module AS Source 
ON Source.ModuleId=Target.ModuleId
WHEN MATCHED THEN
UPDATE SET target.Name=source.Name,target.ParentId=source.ParentId,
           target.MenuTypeId=source.MenuTypeId,target.MenuUrl=source.MenuUrl,
           target.MenuIcon=source.MenuIcon,target.MenuSort=source.MenuSort
WHEN NOT MATCHED THEN
INSERT([ModuleId],[Name],[ParentId],[MenuTypeId],
                    [MenuUrl],[MenuIcon],[MenuSort]) VALUES(source.ModuleId,source.Name,source.ParentId,source.MenuTypeId,source.MenuUrl,
                    source.MenuIcon,source.MenuSort);

DELETE rp FROM dbo.tbl_esg_RolePermission rp
WHERE  NOT EXISTS (SELECT ModuleId FROM @Module WHERE ModuleId=rp.ModuleId);

DELETE m FROM dbo.tbl_esg_Module m
WHERE  NOT EXISTS (SELECT ModuleId FROM @Module WHERE ModuleId=m.ModuleId);


DECLARE @Permission TABLE([PermissionId] SMALLINT,[Name] NVARCHAR(250));

INSERT INTO @Permission([PermissionId],[Name]) VALUES(1,'Create'),(2,'Read'),(3,'Update'),(4,'Delete'),(5,'Export'),(6,'Upload'),(7,'Download'),(8,'Print');

MERGE INTO [tbl_esg_Permission] AS Target
USING @Permission AS Source 
ON Source.PermissionId=Target.PermissionId
WHEN MATCHED THEN
UPDATE SET Target.Name=Source.Name
WHEN NOT MATCHED THEN
INSERT(PermissionId,Name) VALUES(Source.PermissionId,Source.Name);


DECLARE @UserRole TABLE([UserId] INT,[RoleId] SMALLINT);

INSERT INTO @UserRole([UserId],[RoleId]) VALUES(1,1);

MERGE INTO [tbl_esg_UserRole] AS Target
USING @UserRole AS Source 
ON Source.UserId=Target.UserId AND Source.RoleId=Target.RoleId
WHEN NOT MATCHED THEN
INSERT([UserId],[RoleId]) 
VALUES(Source.UserId,Source.RoleId);


DECLARE @RolePermission TABLE([RoleId] SMALLINT,[PermissionId] SMALLINT,[ModuleId] SMALLINT);

INSERT INTO @RolePermission([RoleId],[PermissionId],[ModuleId]) 
            VALUES(1,1,1),
                  (1,2,1),
                  (1,3,1),
                  (1,4,1),
                  (1,5,1),
                  (1,6,1),
                  (1,7,1),
                  (1,8,1),

                  (1,1,2),
                  (1,2,2),
                  (1,3,2),
                  (1,4,2),
                  (1,5,2),
                  (1,6,2),
                  (1,7,2),
                  (1,8,2);


MERGE INTO dbo.tbl_esg_RolePermission AS Target
USING @RolePermission AS Source 
ON Source.RoleId=Target.RoleId AND Source.PermissionId=Target.PermissionId AND Source.ModuleId=Target.ModuleId
WHEN NOT MATCHED THEN 
INSERT([RoleId],[PermissionId],[ModuleId]) VALUES(Source.RoleId,Source.PermissionId,Source.ModuleId);


IF NOT EXISTS (SELECT 1 FROM dbo.tbl_esg_Token)
BEGIN
        -- Enable IDENTITY_INSERT for the Token table
        SET IDENTITY_INSERT dbo.tbl_esg_Token ON;

        MERGE INTO dbo.tbl_esg_Token AS Target
        USING (VALUES
        (1, 'The_Enterprise_Financing_Scheme_–_Green_(EFS_Green)', 'https://www.maybank2u.com.sg/en/business/local-enterprise/financing/government-assistance-schemes/enterprise-financing-scheme-green.page', 'The Enterprise Financing Scheme – Green (EFS Green)', 1, NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2, 'SG_Green_Plan', 'https://www.greenplan.gov.sg/funding/', 'SG Green Plan ', 1,NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (3, 'Sg_Eco_Fund​', 'https://www.mse.gov.sg/sgecofund/apply', 'Sg Eco Fund', 1,NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (4, 'National_Environmental_Agency_(NEA)', 'https://www.nea.gov.sg/programmes-grants/grants-and-awards/call-for-ideas-fund', 'National Environmental Agency (NEA)', 1,NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (5, 'Call for Ideas Fund', 'https://www.nea.gov.sg/programmes-grants/grants-and-awards/call-for-ideas-fund', 'Call for Ideas Fund', 1,NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (6, '3R_Fund','https://www.nea.gov.sg/programmes-grants/grants-and-awards/3r-fund', '3R Fund', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (7, 'Energy_Efficiency_Grant','https://www.nea.gov.sg/programmes-grants/grants-and-awards/energy-efficiency-grant', 'Energy Efficiency Grant', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (8, 'Public_Utilities_Board_(PUB)','https://www.pub.gov.sg/Public/WaterLoop/Water-Conservation/Incentives-and-Grants', 'Public Utilities Board (PUB)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (9, 'Water_Efficiency_Fund_(WEF)','https://www.pub.gov.sg/Public/WaterLoop/Water-Conservation/Incentives-and-Grants/Water-Efficiency-Fund', 'Water Efficiency Fund (WEF)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (10, 'National_Parks_(NParks)','https://www.nparks.gov.sg/cuge', 'National Parks (NParks)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (11, 'Skyrise_Greenery_Incentive_Scheme','https://skyrisegreenery.nparks.gov.sg/incentive-scheme/about/', 'Skyrise Greenery Incentive Scheme', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (12, 'Enterprise_Singapore','https://www.enterprisesg.gov.sg/financial-support/enterprise-financing-scheme---green', 'Enterprise Singapore', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (13, 'Enterprise_Sustainability_Programme','https://www.enterprisesg.gov.sg/Grow-Your-Business/boost-capabilities/sustainability/enterprise-sustainability-programme', 'Enterprise Sustainability Programme', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (14, 'Monetary_Authority_of_Singapore_(MAS)','https://www.mas.gov.sg/search?content_type=Schemes%20and%20Initiatives', 'Monetary Authority of Singapore (MAS)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (15, 'Sustainable_Loan_Grant_Scheme','https://www.mas.gov.sg/search?content_type=Schemes%20and%20Initiatives', 'Sustainable Loan Grant Scheme', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (16, 'Building_and_Construction_Authority_(BCA)','https://www1.bca.gov.sg/buildsg/buildsg-transformation-fund/productivity-solutions-grant', 'Building and Construction Authority (BCA)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (17, 'Productivity_Solutions_Grant_(PSG)','https://www1.bca.gov.sg/buildsg/buildsg-transformation-fund/productivity-solutions-grant', 'Productivity Solutions Grant (PSG)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (18, 'here_1','https://www.mse.gov.sg/', 'here', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (19, 'here_2','https://www.nea.gov.sg/', 'here', 1,null,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (20, 'Singapore_Sets_Out_Eligibility_Criteria_For_International_Carbon_Credits_Under_The_Carbon_Tax_Regime_(mse.gov.sg)​','https://www.mse.gov.sg/resource-room/category/2023-10-04-eligibility-criteria-for-international%20carbon%20credits', 'Singapore Sets Out Eligibility Criteria For International Carbon Credits Under The Carbon Tax Regime (mse.gov.sg)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (21, 'https://www.waste360.com/landfill/singapore-launches-zero-waste-masterplan','https://www.waste360.com/landfill/singapore-launches-zero-waste-masterplan', 'https://www.waste360.com/landfill/singapore-launches-zero-waste-masterplan', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (22, 'https://www.greenplan.gov.sg/targets/','https://www.greenplan.gov.sg/targets/', 'https://www.greenplan.gov.sg/targets/', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (23, 'https://www.straitstimes.com/singapore/environment/singapore-aiming-to-haveemissions-reach-net-zero-by-2050-public- feedback-sought','https://www.straitstimes.com/singapore/environment/singapore-aiming-to-haveemissions-reach-net-zero-by-2050-public-feedback-sought', 'https://www.straitstimes.com/singapore/environment/singapore-aiming-to-haveemissions-reach-net-zero-by-2050-public- feedback-sought', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (24, 'The_Resource_Sustainability_Act_(mse.gov.sg)​','mse.gov.sg', 'The Resource Sustainability Act (mse.gov.sg)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (25, 'What_is_Extended_Producer_Responsibility_(EPR)?_|_CleanHub','https://blog.cleanhub.com/extended-producer-responsibility-how-it-works-and-who-it-works-for', 'What is Extended Producer Responsibility (EPR)? | CleanHub', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (26, 'Carbon_Pricing_Act_(mse.gov.sg)','https://www.mse.gov.sg/policies/climate-change/cpa', 'Carbon Pricing Act (mse.gov.sg)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (27, 'Carbon_Border_Adjustment_Mechanism_|_EUR-Lex_(europa.eu)_,_CBAM​','https://eur-lex.europa.eu/EN/legal-content/summary/carbon-border-adjustment-mechanism.html', 'Carbon Border Adjustment Mechanism | EUR-Lex (europa.eu), CBAM', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (28, 'THE_17_GOALS_|_Sustainble_Development_(un.org)​','https://sdgs.un.org/goals', 'THE 17 GOALS | Sustainble Development (un.org)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (29, 'KPMG_Survey_of_Sustainability_Reporting_2022_,_ESG_integration_supply_chain_(kpmg.com)​','https://www.globalreporting.org/news/news-center/four-in-five-largest-global-companies-report-with-gri/', 'KPMG Survey of Sustainability Reporting 2022, ESG integration supply chain (kpmg.com)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (30, 'IFRS_S1_General_Requirements_for_Disclosure_of_Sustainability-related_Financial_Information​','https://www.ifrs.org/issued-standards/ifrs-sustainability-standards-navigator/ifrs-s1-general-requirements/#about', 'IFRS S1 General Requirements for Disclosure of Sustainability-related Financial Information', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (31, 'https://kpmg.com/de/en/home/insights/2023/06/issb-publishes-ifrs-s1-and-ifrs-s2.html​','https://kpmg.com/de/en/home/insights/2023/06/issb-publishes-ifrs-s1-and-ifrs-s2.html', 'https://kpmg.com/de/en/home/insights/2023/06/issb-publishes-ifrs-s1-and-ifrs-s2.html', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (32, 'ISSB_makes_Scope_3_emission_disclosure_mandatory_(theclimatechoice.com)​','https://theclimatechoice.com/resources/magazine/issb-makes-scope-3-emission-disclosure-mandatory', 'ISSB makes Scope 3 emission disclosure mandatory (theclimatechoice.com)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (33, 'ISO_14001:2015 - Environmental_management_systems​','https://www.iso.org/standard/60857.html', 'ISO 14001:2015 - Environmental management systems', 1,NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (34, 'Getting_Started_on_Sustainability - Singapore_Environment_Council_(SEC)','https://www.sec.org.sg/getting-started-on-sustainability.html', 'Getting Started on Sustainability - Singapore Environment Council (SEC)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (35, 'SGBP_Certification_Scheme_(sgbc.sg)​','https://sgbc.sg/sgbc-certifications/sgbp-certification', 'SGBP Certification Scheme (sgbc.sg)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (36, 'BREEAM_Certification:_Everything_You_Need_to_Know_|_Alpin_Limited_(alpinme.com)','https://www.alpinme.com/guide-to-breeam/', 'BREEAM Certification: Everything You Need to Know | Alpin Limited (alpinme.com)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (37, 'here_3','', 'here', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (38, 'Enterprise_Sustainability_Programme _–_Sustainability_Courses​','https://www.sustain.life/blog/scope-emissions#:~:text=What%20are%20some%20examples%20of%20scope%201%2C%202%2C,the%20use%20of%20a%20product%20or%20service%20sold', 'Enterprise Sustainability Programme – Sustainability Courses', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (39, 'Maybank_Singapore_extends_US$100_million_sustainability_-_linked_Islamic_facility_to_AET_(businesstimes.com.sg)​','https://www.sustain.life/blog/scope-emissions#:~:text=What%20are%20some%20examples%20of%20scope%201%2C%202%2C,the%20use%20of%20a%20product%20or%20service%20sold', 'Maybank Singapore extends US$100 million sustainability-linked Islamic facility to AET (businesstimes.com.sg)', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (40, 'Maybank_Singapore_and_Banyan_Group_Sustainability-Linked_Loan​','https://www.sustain.life/blog/scope-emissions#:~:text=What%20are%20some%20examples%20of%20scope%201%2C%202%2C,the%20use%20of%20a%20product%20or%20service%20sold', 'Maybank Singapore and Banyan Group Sustainability-Linked Loan', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (41, 'Source:_Scope_1,_2,_and_3_Emissions_Explained_|_Workiva_Carbon_(sustain._life)_Understanding_Scope_1,_2,_and_3_Emissions_with_Examples:_2024_Guide_|_Arbor','https://www.sustain.life/blog/scope-emissions#:~:text=What%20are%20some%20examples%20of%20scope%201%2C%202%2C,the%20use%20of%20a%20product%20or%20service%20sold', 'Source: Scope 1, 2, and 3 Emissions Explained | Workiva Carbon (sustain. life) Understanding Scope 1, 2, and 3 Emissions with Examples: 2024 Guide | Arbor', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (42, 'GHG_Protocol_(A_Corporate_Accounting_and_Reporting_Standard_REVISED_EDITION)_pdf​','https://ghgprotocol.org/sites/default/files/standards/ghg-protocol-revised.pdf', 'GHG Protocol (A Corporate Accounting and Reporting Standard REVISED EDITION) pdf', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (43, 'Green Mark certified Commercial Property Loan','Green Mark certified Commercial Property Loan', 'Green Mark certified Commercial Property Loan', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (44, 'EmpowerHer Program','EmpowerHer Program', 'EmpowerHer Program', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (45, 'eFinancing','eFinancing', 'eFinancing', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (46, 'Business Term Loan – Green','Business Term Loan – Green', 'Business Term Loan – Green', 1, NULL,dbo.fn_esg_GetDateFunction(),NULL,NULL)

        ) AS Source (TokenId, TokenKey, TokenValue, Description, IsDefault, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.TokenId = Target.TokenId
        --WHEN MATCHED THEN
        --    UPDATE SET Target.TokenKey = Source.TokenKey
        --    , Target.TokenValue = Source.TokenValue
        --    , Target.Description = Source.Description 
        --    , Target.IsDefault = Source.IsDefault 
        --    , Target.CreatedBy = Source.CreatedBy 
        --    , Target.CreatedDate = Source.CreatedDate
        --    , Target.ModifiedBy = Source.ModifiedBy
        --    , Target.ModifiedDate = Source.ModifiedDate
        WHEN NOT MATCHED THEN
            INSERT (TokenId, TokenKey, TokenValue, Description, IsDefault, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.TokenId, Source.TokenKey, Source.TokenValue, Source.Description, Source.IsDefault,  Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

        -- Disable IDENTITY_INSERT for the Token table
        SET IDENTITY_INSERT dbo.tbl_esg_Token OFF;

END



IF 1=1
BEGIN
        -- Enable IDENTITY_INSERT for the Token table
        SET IDENTITY_INSERT dbo.tbl_esg_Product ON;

        MERGE INTO dbo.tbl_esg_Product AS Target
        USING (VALUES
        (1,2, 'The Enterprise Financing Scheme','https://apply.maybank.com.sg/rsmedigitalfinancing/FinanceDetails?option=PBF&psrc=ESG','Green (EFS Green) provides financial support for businesses embracing sustainability, covering development of green initiatives, purchase of eco-friendly assets, and financing for sustainable projects and trade.', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (2,2, 'Green Mark Commercial Property Loan','https://apply.maybank.com.sg/rsmedigitalfinancing/FinanceDetails?option=PBF&psrc=ESG','The Green Mark Commercial Property Loan provides financing for buying or refinancing properties that achieve Gold Plus or higher Green Mark certification, promoting investment in sustainable buildings.', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (3,2, 'Maybank HERpower','https://www.maybank2u.com.sg/en/myimpact/index.page','The EmpowerHer Program provides financial support for SMEs with over 50% female ownership, offering working capital and property loans.', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (4,2, 'eFinancing scheme','https://apply.maybank.com.sg/rsmedigitalfinancing/FinanceDetails?option=BTL&psrc=ESG','The eFinancing scheme offers an unsecured digital working capital loan up to S$150,000 for micro SMEs, with a maximum term of 5 years.', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL),
        (5,2, 'Sustainable Financing','https://apply.maybank.com.sg/rsmedigitalfinancing/FinanceDetails?option=PBF&psrc=ESG','The Business Term Loan – Green scheme provides working capital financing geared towards environmentally sustainable practices, including solar panel installations.', NULL, dbo.fn_esg_GetDateFunction(),NULL,NULL)
        

        ) AS Source (ProductId, PillarId, ProductName, ProductURL, ProductDescription, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
        ON Source.ProductId = Target.ProductId
        WHEN MATCHED THEN
            UPDATE SET Target.ProductName = Source.ProductName
            , Target.ProductURL = Source.ProductURL
            , Target.ProductDescription = Source.ProductDescription 
        WHEN NOT MATCHED THEN
            INSERT (ProductId, PillarId, ProductName, ProductURL, ProductDescription, CreatedBy, CreatedDate, ModifiedBy,ModifiedDate)
            VALUES (Source.ProductId, Source.PillarId, Source.ProductName, Source.ProductURL,Source.ProductDescription, Source.CreatedBy, Source.CreatedDate, Source.ModifiedBy, Source.ModifiedDate);

        -- Disable IDENTITY_INSERT for the Token table
        SET IDENTITY_INSERT dbo.tbl_esg_Product OFF;

END


delete from [dbo].[tbl_esg_AnswerRecommendation]
IF NOT EXISTS (SELECT 1 FROM dbo.tbl_esg_AnswerRecommendation)
BEGIN

SET IDENTITY_INSERT [dbo].[tbl_esg_AnswerRecommendation] ON 

INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1073, 1, 1, N'<ul><li><p>Update and promote the sustainability policy company-wide. Consider aligning your policy to Singapore Green Plan 2030.</p><p>More about the Singapore Green Plan can be found in the Sustainability Playbook.</p></li></ul>', 2, CAST(N'2024-10-27T12:53:04.233' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1074, 2, 1, N'<ul><li>Initiate the development of a unified sustainability policy that encapsulates your company''s vision and objectives, paving the way for organisation-wide implementation.</li></ul>', 2, CAST(N'2024-10-27T12:53:04.233' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1075, 1, 2, N'<ul><li>Tie sustainability goals and resource allocation into strategy planning.</li></ul>', 2, CAST(N'2024-10-27T12:53:13.310' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1076, 2, 2, N'<ul><li><p>Ensure sustainability and ESG factors are consistently addressed in leadership discussions and integrated into decision-making.</p><p>Refer to the Sustainability Accounting Standards Board (SASB) Standards to identify the material ESG topics relevant to your business sector.</p></li></ul>', 2, CAST(N'2024-10-27T12:53:13.310' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1077, 1, 3, N'<ul><li>Appoint a Sustainability Lead to work alongside a Sustainability Working Committee (SWC) composed of representatives from various business units, fostering ongoing stakeholder engagement.</li><li>Establish a Sustainability Steering Committee (SSC) to oversee the Sustainability Working Committee (SWC) activities, ensuring clear roles and responsibilities for sustainability while promoting continuous education and learning opportunities.</li></ul>', 2, CAST(N'2024-10-27T12:53:26.507' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1078, 2, 3, N'<ul><li>Form a sustainability working committee or “sustainability team” consisting of employees from different departments to lead and champion sustainability initiatives.</li><li>Develop internal procedures (e.g. sustainable project proposal submission, screening and evaluation) &nbsp;for spotting and assessing potential green or social projects.</li></ul>', 2, CAST(N'2024-10-27T12:53:26.507' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1079, 1, 4, N'<ul><li>Share your success stories in addressing sustainability-related issues and disseminate best practices among your stakeholders, potentially extending this outreach to the wider industry.</li><li>Employ interactive techniques, such as workshops and co-creation sessions, to strengthen stakeholder engagement in sustainability discussions.</li></ul>', 2, CAST(N'2024-10-27T12:53:37.643' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1080, 2, 4, N'<ul><li>Proactively identify and engage key stakeholders such as suppliers, customers, investors and regulators, at least on a quarterly basis to gather insights on sustainability concerns, particularly on social issues in ASEAN countries such as supply chain labor practices and diversity, equity and inclusion, and health and well-being.</li></ul>', 2, CAST(N'2024-10-27T12:53:37.643' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1081, 1, 5, N'<ul><li><p>Set more ambitious sustainability targets by aligning your goals with the Singapore Green Plan 2030 and adopting science-based targets.</p><p>More about the Singapore Green Plan can be found in the Sustainability Playbook.</p></li><li>Use these targets to qualify for sustainability-linked financing, incentivising achievement of specific Sustainability Key Performance Indicators (KPIs) / Sustainability Performance Targets (SPTs).</li><li>Partner with experts for technical analyses on decarbonisation strategies and feasibility studies.</li></ul>', 2, CAST(N'2024-10-27T12:53:57.840' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1082, 2, 5, N'<ul><li><p>Establish a time-bound sustainability roadmap outlining key targets and specific actions required to achieve goals such as reducing GHG emissions.</p><p>More about the GHG emissions can be found in the Sustainability Playbook.</p></li><li>Implement sustainability initiatives in phases / milestones, allowing for gradual progress towards the set targets.</li></ul>', 2, CAST(N'2024-10-27T12:53:57.840' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1083, 1, 6, N'<ul><li>Regularly refine your sustainability strategy to stay aligned with evolving risks and integrate these considerations into corporate risk management for enhanced resilience.</li></ul>', 2, CAST(N'2024-10-27T12:54:06.337' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1084, 2, 6, N'<ul><li>Identify and assess ESG-related risks and opportunities relevant to your industry and operations, and incorporate them in your business strategy.</li></ul>', 2, CAST(N'2024-10-27T12:54:06.337' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1085, 1, 7, N'<ul><li>Enhance your knowledge of sustainable finance and continuously assess project impacts to optimise resources and explore varied funding avenues for sustainability efforts.</li><li><p>Pursue more sustainable financing and grants opportunities, aligning with frameworks like Task Force on Climate-Related Financial Disclosures (TCFD) and seeking Second Party Opinions (SPOs) on your sustainable finance framework customised to your company''s needs.</p><p>You can consider Maybank Sustainable Financing Solutions. These solutions typically encompass various financial products tailored for companies aiming to implement environmentally and socially responsible practices.</p><p>More about Sustainable Financing can be found in the Sustainability Playbook.</p></li><li>Develop deeper strategic partnerships with agencies such as National Environment Agency (NEA) and Public Utilities Board (PUB) to build collaborative relationships in sharing resources and expertise in high-impact environmental and social projects.</li></ul>', 2, CAST(N'2024-10-27T12:54:29.180' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1086, 2, 7, N'<ul><li>Develop a clear understanding of sustainable financing. Review your financial institution''s sustainable financing framework to identify which sustainability initiatives are eligible for financing.</li><li><p>Obtain sustainable financing and grants, aligning with frameworks like Task Force on Climate-Related Financial Disclosures (TCFD) and seeking Second Party Opinions (SPOs) on your sustainable finance framework customised to your company''s needs.<br><br>You can consider Maybank Sustainable Financing Solutions. These solutions typically encompass various financial products tailored for companies aiming to implement environmentally and socially responsible practices.</p><p>More about Sustainable Financing can be found in the Sustainability Playbook.</p></li><li><p>Apply for available support Grants provided by the Singapore Government. These grants are designed to help businesses navigate challenges, foster growth, and drive innovation in the area of sustainability.</p><p>More about Government Grants can be found in the Sustainability Playbook.</p></li></ul>', 2, CAST(N'2024-10-27T12:54:29.180' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1087, 1, 8, N'<ul><li>Develop platforms such as forums, networking events and focus group discussions for partnering with industry peers to enhance sustainability practices through shared knowledge and resources.</li><li>Engage in global sustainability commitments such as the United Nations Sustainable Development Goals (UNSDGs) to share insights and influence peer businesses through successful and impactful case studies, while adapting to evolving ESG consumer preferences.</li></ul>', 2, CAST(N'2024-10-27T12:54:49.773' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1088, 2, 8, N'<ul><li>Join industry groups to maximise impact through collective action and benchmarking against best practices in sustainability.</li><li>Contribute to industry consultations with government bodies and join sector alliances such as the Sustainable Energy Association of Singapore (SEAS) and UN Global Compact Network Singapore (UN GCNS) for shared environmental challenges and solutions.</li></ul>', 2, CAST(N'2024-10-27T12:54:49.773' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1089, 1, 9, N'<ul><li>Enhance ESG skills with targeted training on carbon footprint, social impact, ethical leadership, and governance best practices for all departments, especially departments involved in sustainability-related matters, such as the Sustainability Steering Committee (SSC) and the Sustainability Working Committee (SWC).</li><li><p>Regularly update training programs to meet current sustainability standards.</p><p>You can consider taking on sustainability trainings and courses. These courses are designed to equip businesses with the knowledge and skills necessary to implement sustainable practices effectively.</p><p>More about Sustainability Trainings can be found in the Sustainability Playbook.</p></li></ul>', 2, CAST(N'2024-10-27T12:55:20.577' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1090, 2, 9, N'<ul><li><p>Provide foundational sustainability awareness training for all employees and ensure key staff complete specialised ESG programs.</p><p>You can consider taking on sustainability trainings and courses. These courses are designed to equip businesses with the knowledge and skills necessary to implement sustainable practices effectively.</p><p>More about Sustainability Trainings can be found in the Sustainability Playbook.</p></li></ul>', 2, CAST(N'2024-10-27T12:55:20.577' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1091, 1, 10, N'<ul><li>To conduct regular materiality assessments to ensure the relevance of key ESG topics, and consider involving an independent sustainability consultancy for validation.</li></ul>', 2, CAST(N'2024-10-27T12:55:28.617' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1092, 2, 10, N'<ul><li>Collaborate with key stakeholders (e.g., employees, customers, investors, and suppliers) to gather insights on potential ESG-related risks and opportunities.</li></ul>', 2, CAST(N'2024-10-27T12:55:28.617' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1097, 1, 12, N'<ul><li>Document stakeholder-reported ESG issues and concerns.</li><li>Use stakeholder insights to refine and improve your sustainability strategy.</li></ul>', 2, CAST(N'2024-10-27T12:55:51.140' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1098, 2, 12, N'<ul><li>Identify and actively engage internal and external key stakeholders to understand and address mutual concerns regarding sustainability.</li></ul>', 2, CAST(N'2024-10-27T12:55:51.140' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1099, 1, 13, N'<ul><li>Document and refine methodologies for accurate ESG data to measure progress against baseline values and benchmark against peers.</li><li>Identify and address gaps in ESG data collection and management, leveraging sustainability solutions such as STACS ESGpedia or Greenprint for efficiency.</li></ul>', 2, CAST(N'2024-10-27T12:56:04.183' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1100, 2, 13, N'<ul><li><p>Conduct materiality assessments to understand and address the significant topics affecting your business and stakeholders with the help of frameworks such as GRI materiality assessment process, SASB industry-specific standards, and TCFD for Climate-Related Risks and Opportunities.</p><p>More about Sustainability Reporting can be found in the Sustainability Playbook.</p></li><li>Define and establish baseline KPIs such as GHG emissions, energy consumption, water consumption, waste generation, diversity, occupational health and safety, and business ethics.</li></ul>', 2, CAST(N'2024-10-27T12:56:04.183' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1101, 1, 14, N'<ul><li>Embed ESG criteria in departmental objectives and personnel rewards, ensuring alignment with the organisation’s sustainability goals.</li><li>Continuously assess progress against established ESG KPI baselines and expand the scope as needed. Share successes to reinforce commitment and drive stakeholder engagement.</li><li>Regularly review, adjust and establish more ambitious sustainability targets such as science-based targets (SBTi) to maintain their relevance, adapting to evolving conditions.</li></ul>', 2, CAST(N'2024-10-27T12:56:18.640' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1102, 2, 14, N'<ul><li>Establish quantitative sustainability targets to effectively reduce greenhouse gas (GHG) emissions and align with current trends and best practices. Adopt a structured approach to set these targets over the next 5-10 years, categorising them into short-term, medium-term, and long-term goals.</li><li>Regularly review and adjust sustainability targets to maintain their relevance, adapting to evolving conditions.</li></ul>', 2, CAST(N'2024-10-27T12:56:18.640' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1103, 1, 15, N'<ul><li><p>Stay updated with global sustainability reporting standards, such as the ISSB''s IFRS S1 and S2 Standards.</p><p>More about Sustainability Reporting can be found in the Sustainability Playbook.</p></li></ul>', 2, CAST(N'2024-10-27T12:56:31.273' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1104, 2, 15, N'<ul><li><p>Start developing a sustainability report that aligns with widely recognised international standards, such as the GRI standards. Communicate with stakeholders by publishing this report annually.</p><p>Additionally, stay updated with global sustainability reporting standards, such as the ISSB''s IFRS S1 and S2 Standards.</p><p>More about Sustainability Reporting can be found in the Sustainability Playbook.</p></li></ul>', 2, CAST(N'2024-10-27T12:56:31.273' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1105, 1, 16, N'<ul><li>Leverage the assurance of your sustainability performance data (whether internal or external) to build trust among stakeholders. This process enhances data quality, transparency, credibility, and supports better decision-making while ensuring alignment with regulatory requirements.</li><li>Leverage ESG assurance outcomes to perpetually refine your sustainability strategies and practices.</li></ul>', 2, CAST(N'2024-10-27T12:56:40.740' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1106, 2, 16, N'<ul><li>Conduct internal ESG assurance to assess the precision of your sustainability data and explore external ESG assurance for added credibility.</li><li>Enhance your ESG team with the knowledge to conduct ESG assurance.</li></ul>', 2, CAST(N'2024-10-27T12:56:40.740' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1107, 1, 17, N'<ul><li><p>Leverage ISO 14001 and similar certifications to use as a basis for continuous improvement by adopting industry best practices.</p><p>More about Sustainability Certifications can be found in the Sustainability Playbook.</p></li></ul>', 2, CAST(N'2024-10-27T12:56:51.663' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1108, 2, 17, N'<ul><li>Understand ISO 14001''s applicability to your business and implement fundamental sustainability practices as initial compliance steps.</li><li><p>Pursue ISO 14001 Environmental Management Systems certification and seek industry-specific certifications for recognition.</p><p>More about Sustainability Certifications can be found in the Sustainability Playbook.</p></li></ul>', 2, CAST(N'2024-10-27T12:56:51.663' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1109, 1, 11, N'<ul><li>Continually refine your processes and policies to address ESG-related risks, including those related to supply chain challenges and transparency. Conduct regular reviews and adapt approaches as necessary based on changing circumstances or new information.</li></ul>', 2, CAST(N'2024-10-27T13:02:55.190' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_esg_AnswerRecommendation] ([AnswerRecommendationId], [PredefinedAnswersId], [QuestionsId], [Recommendation], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1110, 2, 11, N'<ul><li>Establish structured risk mitigation process for identifying, evaluating, and managing sustainability-related risks.</li></ul>', 2, CAST(N'2024-10-27T13:02:55.190' AS DateTime), NULL, NULL, 0)


SET IDENTITY_INSERT [dbo].[tbl_esg_AnswerRecommendation] OFF


END


                    