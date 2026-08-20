.class public Lcom/kt/olleh/inapp/dialog/DialogPay;
.super Landroid/app/Dialog;
.source "DialogPay.java"


# instance fields
.field private buttonCount:I

.field private buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

.field private buttonTexts:[Ljava/lang/String;

.field private isBgChange:Z

.field private isPayInformation:Z

.field private isPayMessage:Z

.field private isPayNameTitle:Z

.field private mContext:Landroid/content/Context;

.field mParser:Lcom/kt/olleh/inapp/util/UIParser;

.field private mXML:Ljava/lang/String;

.field private message:Ljava/lang/String;

.field private payMoney:Ljava/lang/String;

.field private payName1:Ljava/lang/String;

.field private payName2:Ljava/lang/String;

.field private payType:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "buttonCount"    # I
    .param p3, "xmlPath"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 38
    const v0, 0x1030010

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    .line 20
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->title:Ljava/lang/String;

    .line 21
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->message:Ljava/lang/String;

    .line 22
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    .line 23
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 25
    iput-boolean v2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayNameTitle:Z

    .line 26
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payName1:Ljava/lang/String;

    .line 27
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payName2:Ljava/lang/String;

    .line 28
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payMoney:Ljava/lang/String;

    .line 29
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payType:Ljava/lang/String;

    .line 31
    iput-boolean v2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayInformation:Z

    .line 32
    iput-boolean v2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayMessage:Z

    .line 34
    iput-boolean v2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isBgChange:Z

    .line 40
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mContext:Landroid/content/Context;

    .line 41
    iput p2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    .line 42
    iput-object p3, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mXML:Ljava/lang/String;

    .line 44
    iget v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    if-lez v0, :cond_0

    .line 46
    iget v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    .line 47
    iget v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    new-array v0, v0, [Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    iput-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 49
    :cond_0
    return-void
.end method

.method private create()V
    .locals 17

    .prologue
    .line 98
    const-string v15, "/layout/dialog_pay.xml"

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->showMy(Ljava/lang/String;)Landroid/view/View;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setContentView(Landroid/view/View;)V

    .line 100
    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/dialog/DialogPay;->getWindow()Landroid/view/Window;

    move-result-object v15

    invoke-virtual {v15}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v11

    .line 101
    .local v11, "lp":Landroid/view/WindowManager$LayoutParams;
    const v15, 0x3f333333    # 0.7f

    iput v15, v11, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 102
    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/dialog/DialogPay;->getWindow()Landroid/view/Window;

    move-result-object v15

    invoke-virtual {v15, v11}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 103
    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/dialog/DialogPay;->getWindow()Landroid/view/Window;

    move-result-object v15

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Landroid/view/Window;->addFlags(I)V

    .line 106
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_Title"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/LinearLayout;

    .line 107
    .local v13, "titleLayout":Landroid/widget/LinearLayout;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialogAlertTitleTextView"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 108
    .local v14, "titleTextView":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->title:Ljava/lang/String;

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->title:Ljava/lang/String;

    if-eqz v15, :cond_0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->title:Ljava/lang/String;

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 111
    :cond_0
    const/16 v15, 0x8

    invoke-virtual {v13, v15}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 115
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_MessageTextView"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 116
    .local v12, "messageTextView":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->message:Ljava/lang/String;

    if-eqz v15, :cond_2

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->message:Ljava/lang/String;

    const-string v16, ""

    move-object/from16 v0, v16

    if-eq v15, v0, :cond_2

    .line 118
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->message:Ljava/lang/String;

    invoke-static {v15}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v15

    invoke-virtual {v12, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    :cond_2
    move-object/from16 v0, p0

    iget v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    if-lez v15, :cond_4

    .line 124
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "Button_Layout"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 125
    .local v2, "ButtonLayout":Landroid/widget/LinearLayout;
    const/4 v15, 0x0

    invoke-virtual {v2, v15}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 127
    move-object/from16 v0, p0

    iget v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    new-array v3, v15, [Landroid/widget/Button;

    .line 128
    .local v3, "DialogButton":[Landroid/widget/Button;
    const/4 v15, 0x3

    new-array v1, v15, [Ljava/lang/String;

    .line 129
    .local v1, "ButtonID":[Ljava/lang/String;
    const/4 v15, 0x0

    const-string v16, "Button_1"

    aput-object v16, v1, v15

    .line 130
    const/4 v15, 0x1

    const-string v16, "Button_2"

    aput-object v16, v1, v15

    .line 131
    const/4 v15, 0x2

    const-string v16, "Button_3"

    aput-object v16, v1, v15

    .line 133
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    array-length v15, v3

    if-lt v10, v15, :cond_5

    .line 138
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    if-eqz v15, :cond_3

    .line 140
    const/4 v10, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    if-lt v10, v15, :cond_6

    .line 147
    :cond_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    if-eqz v15, :cond_4

    .line 149
    const/4 v10, 0x0

    :goto_2
    move-object/from16 v0, p0

    iget v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonCount:I

    if-lt v10, v15, :cond_7

    .line 156
    .end local v1    # "ButtonID":[Ljava/lang/String;
    .end local v2    # "ButtonLayout":Landroid/widget/LinearLayout;
    .end local v3    # "DialogButton":[Landroid/widget/Button;
    .end local v10    # "i":I
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayMessage:Z

    if-eqz v15, :cond_e

    .line 158
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayNameTitle"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 159
    .local v8, "dialog_PayNameTitleTextView":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayNameTitle:Z

    if-nez v15, :cond_8

    .line 161
    const/16 v15, 0x8

    invoke-virtual {v8, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 169
    :goto_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayName1"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 170
    .local v6, "dialog_PayNameTextView1":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payName1:Ljava/lang/String;

    if-eqz v15, :cond_9

    .line 172
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payName1:Ljava/lang/String;

    invoke-virtual {v6, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    :goto_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayName2"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 180
    .local v7, "dialog_PayNameTextView2":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payName2:Ljava/lang/String;

    if-eqz v15, :cond_a

    .line 182
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payName2:Ljava/lang/String;

    invoke-virtual {v7, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    :goto_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayMoney"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 190
    .local v5, "dialog_PayMoneyTextView1":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payMoney:Ljava/lang/String;

    if-eqz v15, :cond_b

    .line 192
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payMoney:Ljava/lang/String;

    invoke-virtual {v5, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    :goto_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayType"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 200
    .local v9, "dialog_PayTypeTextView1":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payType:Ljava/lang/String;

    if-eqz v15, :cond_c

    .line 202
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payType:Ljava/lang/String;

    invoke-virtual {v9, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    :goto_7
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayMessage"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    .line 210
    .local v4, "dialog_PayInformation":Landroid/widget/LinearLayout;
    const/4 v15, 0x0

    invoke-virtual {v4, v15}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 212
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isBgChange:Z

    if-eqz v15, :cond_d

    .line 214
    const v15, 0x106000d

    invoke-virtual {v4, v15}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 227
    .end local v5    # "dialog_PayMoneyTextView1":Landroid/widget/TextView;
    .end local v6    # "dialog_PayNameTextView1":Landroid/widget/TextView;
    .end local v7    # "dialog_PayNameTextView2":Landroid/widget/TextView;
    .end local v8    # "dialog_PayNameTitleTextView":Landroid/widget/TextView;
    .end local v9    # "dialog_PayTypeTextView1":Landroid/widget/TextView;
    :goto_8
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayInformation:Z

    if-eqz v15, :cond_f

    .line 229
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayInformation"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "dialog_PayInformation":Landroid/widget/LinearLayout;
    check-cast v4, Landroid/widget/LinearLayout;

    .line 230
    .restart local v4    # "dialog_PayInformation":Landroid/widget/LinearLayout;
    const/4 v15, 0x0

    invoke-virtual {v4, v15}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 237
    :goto_9
    return-void

    .line 135
    .end local v4    # "dialog_PayInformation":Landroid/widget/LinearLayout;
    .restart local v1    # "ButtonID":[Ljava/lang/String;
    .restart local v2    # "ButtonLayout":Landroid/widget/LinearLayout;
    .restart local v3    # "DialogButton":[Landroid/widget/Button;
    .restart local v10    # "i":I
    :cond_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    aget-object v16, v1, v10

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/Button;

    aput-object v15, v3, v10

    .line 133
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 142
    :cond_6
    aget-object v15, v3, v10

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Landroid/widget/Button;->setVisibility(I)V

    .line 143
    aget-object v15, v3, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    move-object/from16 v16, v0

    aget-object v16, v16, v10

    invoke-virtual/range {v15 .. v16}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 140
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_1

    .line 151
    :cond_7
    aget-object v15, v3, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    move-object/from16 v16, v0

    aget-object v16, v16, v10

    invoke-virtual/range {v15 .. v16}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_2

    .line 165
    .end local v1    # "ButtonID":[Ljava/lang/String;
    .end local v2    # "ButtonLayout":Landroid/widget/LinearLayout;
    .end local v3    # "DialogButton":[Landroid/widget/Button;
    .end local v10    # "i":I
    .restart local v8    # "dialog_PayNameTitleTextView":Landroid/widget/TextView;
    :cond_8
    const/4 v15, 0x0

    invoke-virtual {v8, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_3

    .line 176
    .restart local v6    # "dialog_PayNameTextView1":Landroid/widget/TextView;
    :cond_9
    const/16 v15, 0x8

    invoke-virtual {v6, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 186
    .restart local v7    # "dialog_PayNameTextView2":Landroid/widget/TextView;
    :cond_a
    const/16 v15, 0x8

    invoke-virtual {v7, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_5

    .line 196
    .restart local v5    # "dialog_PayMoneyTextView1":Landroid/widget/TextView;
    :cond_b
    const/16 v15, 0x8

    invoke-virtual {v5, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_6

    .line 206
    .restart local v9    # "dialog_PayTypeTextView1":Landroid/widget/TextView;
    :cond_c
    const/16 v15, 0x8

    invoke-virtual {v9, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_7

    .line 218
    .restart local v4    # "dialog_PayInformation":Landroid/widget/LinearLayout;
    :cond_d
    const v15, 0x106000b

    invoke-virtual {v4, v15}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    goto/16 :goto_8

    .line 223
    .end local v4    # "dialog_PayInformation":Landroid/widget/LinearLayout;
    .end local v5    # "dialog_PayMoneyTextView1":Landroid/widget/TextView;
    .end local v6    # "dialog_PayNameTextView1":Landroid/widget/TextView;
    .end local v7    # "dialog_PayNameTextView2":Landroid/widget/TextView;
    .end local v8    # "dialog_PayNameTitleTextView":Landroid/widget/TextView;
    .end local v9    # "dialog_PayTypeTextView1":Landroid/widget/TextView;
    :cond_e
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayMessage"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    .line 224
    .restart local v4    # "dialog_PayInformation":Landroid/widget/LinearLayout;
    const/16 v15, 0x8

    invoke-virtual {v4, v15}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_8

    .line 234
    :cond_f
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v16, "dialog_PayInformation"

    invoke-virtual/range {v15 .. v16}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/kt/olleh/inapp/dialog/DialogPay;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "dialog_PayInformation":Landroid/widget/LinearLayout;
    check-cast v4, Landroid/widget/LinearLayout;

    .line 235
    .restart local v4    # "dialog_PayInformation":Landroid/widget/LinearLayout;
    const/16 v15, 0x8

    invoke-virtual {v4, v15}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_9
.end method

.method private setButtonOCL(ILcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V
    .locals 1
    .param p1, "idx"    # I
    .param p2, "buttonOCL"    # Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .prologue
    .line 259
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    array-length v0, v0

    if-le v0, p1, :cond_0

    if-ltz p1, :cond_0

    .line 260
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    aput-object p2, v0, p1

    .line 261
    :cond_0
    return-void
.end method

.method private setButtonText(ILjava/lang/String;)V
    .locals 1
    .param p1, "idx"    # I
    .param p2, "buttonText"    # Ljava/lang/String;

    .prologue
    .line 254
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    array-length v0, v0

    if-le v0, p1, :cond_0

    if-ltz p1, :cond_0

    .line 255
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    aput-object p2, v0, p1

    .line 256
    :cond_0
    return-void
.end method

.method private showMy(Ljava/lang/String;)Landroid/view/View;
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 92
    new-instance v0, Lcom/kt/olleh/inapp/util/UIParser;

    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/util/UIParser;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    .line 93
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    invoke-virtual {v0, p1}, Lcom/kt/olleh/inapp/util/UIParser;->Start(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogPay;->unBind()V

    .line 60
    const/4 v0, -0x1

    sput v0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 61
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 62
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x0

    return v0
.end method

.method public setBgColor(Z)V
    .locals 0
    .param p1, "isBgChange"    # Z

    .prologue
    .line 296
    iput-boolean p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isBgChange:Z

    .line 297
    return-void
.end method

.method public setButton(ILjava/lang/String;Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V
    .locals 0
    .param p1, "idx"    # I
    .param p2, "buttonText"    # Ljava/lang/String;
    .param p3, "buttonOCL"    # Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .prologue
    .line 249
    invoke-direct {p0, p1, p2}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setButtonText(ILjava/lang/String;)V

    .line 250
    invoke-direct {p0, p1, p3}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setButtonOCL(ILcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 251
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 244
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->message:Ljava/lang/String;

    .line 245
    return-void
.end method

.method public setPayInformation(Z)V
    .locals 0
    .param p1, "isPayInformation"    # Z

    .prologue
    .line 288
    iput-boolean p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayInformation:Z

    .line 289
    return-void
.end method

.method public setPayMessage(Z)V
    .locals 0
    .param p1, "isPayMessage"    # Z

    .prologue
    .line 292
    iput-boolean p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayMessage:Z

    .line 293
    return-void
.end method

.method public setPayMoneyMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 276
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payMoney:Ljava/lang/String;

    .line 277
    return-void
.end method

.method public setPayNameMessage(ILjava/lang/String;)V
    .locals 0
    .param p1, "line"    # I
    .param p2, "itemname"    # Ljava/lang/String;

    .prologue
    .line 264
    packed-switch p1, :pswitch_data_0

    .line 273
    :goto_0
    return-void

    .line 267
    :pswitch_0
    iput-object p2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payName1:Ljava/lang/String;

    goto :goto_0

    .line 270
    :pswitch_1
    iput-object p2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payName2:Ljava/lang/String;

    goto :goto_0

    .line 264
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setPayNameTitle(Z)V
    .locals 0
    .param p1, "isPayNameTitle"    # Z

    .prologue
    .line 284
    iput-boolean p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->isPayNameTitle:Z

    .line 285
    return-void
.end method

.method public setPayTypeMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 280
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->payType:Ljava/lang/String;

    .line 281
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 240
    check-cast p1, Ljava/lang/String;

    .end local p1    # "title":Ljava/lang/CharSequence;
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->title:Ljava/lang/String;

    .line 241
    return-void
.end method

.method public show()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/kt/olleh/inapp/dialog/DialogPay;->create()V

    .line 54
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 55
    return-void
.end method

.method public unBind()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 71
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 73
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    array-length v1, v1

    if-lt v0, v1, :cond_2

    .line 76
    iput-object v2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    .line 79
    .end local v0    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    if-eqz v1, :cond_1

    .line 81
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    array-length v1, v1

    if-lt v0, v1, :cond_3

    .line 84
    iput-object v2, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 86
    .end local v0    # "i":I
    :cond_1
    return-void

    .line 74
    .restart local v0    # "i":I
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonTexts:[Ljava/lang/String;

    aput-object v2, v1, v0

    .line 73
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 82
    :cond_3
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogPay;->buttonOCLs:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    aput-object v2, v1, v0

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
