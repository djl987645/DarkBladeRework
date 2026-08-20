.class public Lcom/kt/olleh/inapp/dialog/DialogLogin;
.super Landroid/app/Dialog;
.source "DialogLogin.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

.field mParser:Lcom/kt/olleh/inapp/util/UIParser;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    const v0, 0x1030010

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 16
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 22
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mContext:Landroid/content/Context;

    .line 23
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    iput-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 24
    return-void
.end method

.method private create()V
    .locals 9

    .prologue
    const/4 v8, 0x2

    .line 65
    const-string v6, "/layout/dialog_login.xml"

    invoke-direct {p0, v6}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->showMy(Ljava/lang/String;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->setContentView(Landroid/view/View;)V

    .line 67
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    .line 68
    .local v4, "lp":Landroid/view/WindowManager$LayoutParams;
    const v6, 0x3f333333    # 0.7f

    iput v6, v4, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 69
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 70
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/view/Window;->addFlags(I)V

    .line 73
    iget-object v6, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v7, "login_id"

    invoke-virtual {v6, v7}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 74
    .local v3, "idEdit":Landroid/widget/EditText;
    const-string v6, ""

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v6, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v7, "login_password"

    invoke-virtual {v6, v7}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 77
    .local v5, "passEdit":Landroid/widget/EditText;
    const-string v6, ""

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 79
    new-array v1, v8, [Landroid/widget/Button;

    .line 80
    .local v1, "DialogButton":[Landroid/widget/Button;
    const/4 v6, 0x3

    new-array v0, v6, [Ljava/lang/String;

    .line 81
    .local v0, "ButtonID":[Ljava/lang/String;
    const/4 v6, 0x0

    const-string v7, "Button_1"

    aput-object v7, v0, v6

    .line 82
    const/4 v6, 0x1

    const-string v7, "Button_2"

    aput-object v7, v0, v6

    .line 84
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v1

    if-lt v2, v6, :cond_1

    .line 89
    iget-object v6, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    if-eqz v6, :cond_0

    .line 91
    const/4 v2, 0x0

    :goto_1
    iget-object v6, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    array-length v6, v6

    if-lt v2, v6, :cond_2

    .line 96
    :cond_0
    return-void

    .line 86
    :cond_1
    iget-object v6, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    aget-object v7, v0, v2

    invoke-virtual {v6, v7}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    aput-object v6, v1, v2

    .line 84
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 93
    :cond_2
    aget-object v6, v1, v2

    iget-object v7, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    aget-object v7, v7, v2

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private showMy(Ljava/lang/String;)Landroid/view/View;
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 59
    new-instance v0, Lcom/kt/olleh/inapp/util/UIParser;

    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/util/UIParser;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    .line 60
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    invoke-virtual {v0, p1}, Lcom/kt/olleh/inapp/util/UIParser;->Start(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->unBind()V

    .line 35
    const/4 v0, -0x1

    sput v0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 36
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 37
    return-void
.end method

.method public getID()Ljava/lang/String;
    .locals 3

    .prologue
    .line 104
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v2, "login_id"

    invoke-virtual {v1, v2}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 105
    .local v0, "idEdit":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getPassword()Ljava/lang/String;
    .locals 3

    .prologue
    .line 109
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v2, "login_id"

    invoke-virtual {v1, v2}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 110
    .local v0, "idEdit":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    return v0
.end method

.method public setButton(ILcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V
    .locals 1
    .param p1, "idx"    # I
    .param p2, "listener"    # Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    array-length v0, v0

    if-le v0, p1, :cond_0

    if-ltz p1, :cond_0

    .line 100
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    aput-object p2, v0, p1

    .line 101
    :cond_0
    return-void
.end method

.method public show()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->create()V

    .line 29
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 30
    return-void
.end method

.method public unBind()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 46
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    if-eqz v1, :cond_0

    .line 48
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    array-length v1, v1

    if-lt v0, v1, :cond_1

    .line 51
    iput-object v2, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 53
    .end local v0    # "i":I
    :cond_0
    return-void

    .line 49
    .restart local v0    # "i":I
    :cond_1
    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogLogin;->mListener:[Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    aput-object v2, v1, v0

    .line 48
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
