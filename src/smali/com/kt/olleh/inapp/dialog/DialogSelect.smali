.class public Lcom/kt/olleh/inapp/dialog/DialogSelect;
.super Landroid/app/Dialog;
.source "DialogSelect.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mItemListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

.field private mListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

.field mParser:Lcom/kt/olleh/inapp/util/UIParser;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 21
    const v0, 0x1030010

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 16
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 17
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mItemListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 23
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mContext:Landroid/content/Context;

    .line 24
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 25
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mItemListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 26
    return-void
.end method

.method private create()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 72
    const-string v4, "/layout/dialog_select.xml"

    invoke-direct {p0, v4}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->showMy(Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->setContentView(Landroid/view/View;)V

    .line 74
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    .line 75
    .local v3, "lp":Landroid/view/WindowManager$LayoutParams;
    const v4, 0x3f333333    # 0.7f

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 76
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 77
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/view/Window;->addFlags(I)V

    .line 79
    iget-object v4, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v5, "btn_select_1"

    invoke-virtual {v4, v5}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 80
    .local v0, "btn1":Landroid/widget/TextView;
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setClickable(Z)V

    .line 81
    const-string v4, "1"

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 82
    iget-object v4, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mItemListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    iget-object v4, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v5, "btn_select_2"

    invoke-virtual {v4, v5}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 85
    .local v1, "btn2":Landroid/widget/TextView;
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setClickable(Z)V

    .line 86
    const-string v4, "2"

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 87
    iget-object v4, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mItemListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v4, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    const-string v5, "btn_ok"

    invoke-virtual {v4, v5}, Lcom/kt/olleh/inapp/util/UIParser;->getID(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 90
    .local v2, "dialogButton":Landroid/widget/Button;
    iget-object v4, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    return-void
.end method

.method private showMy(Ljava/lang/String;)Landroid/view/View;
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 66
    new-instance v0, Lcom/kt/olleh/inapp/util/UIParser;

    iget-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/util/UIParser;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    .line 67
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    invoke-virtual {v0, p1}, Lcom/kt/olleh/inapp/util/UIParser;->Start(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->unBind()V

    .line 37
    const/4 v0, -0x1

    sput v0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 38
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 39
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x0

    return v0
.end method

.method public setOnCancelListener(Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 95
    return-void
.end method

.method public setOnItemClickListener(Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mItemListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 100
    return-void
.end method

.method public show()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->create()V

    .line 31
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 32
    return-void
.end method

.method public unBind()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 43
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    if-eqz v0, :cond_0

    .line 45
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    if-eqz v0, :cond_1

    .line 50
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/util/UIParser;->clear()V

    .line 51
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mParser:Lcom/kt/olleh/inapp/util/UIParser;

    .line 54
    :cond_1
    iput-object v1, p0, Lcom/kt/olleh/inapp/dialog/DialogSelect;->mItemListener:Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;

    .line 55
    return-void
.end method
