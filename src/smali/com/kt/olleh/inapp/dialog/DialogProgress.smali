.class public Lcom/kt/olleh/inapp/dialog/DialogProgress;
.super Ljava/lang/Object;
.source "DialogProgress.java"


# instance fields
.field private dialog:Landroid/app/Dialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    const/4 v8, -0x1

    const/4 v7, -0x2

    const/16 v6, 0xa

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dialog:Landroid/app/Dialog;

    .line 18
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 19
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 20
    .local v1, "dialogLayout":Landroid/widget/LinearLayout;
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v5, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 22
    .local v4, "tv":Landroid/widget/TextView;
    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 23
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    const/high16 v5, 0x41800000    # 16.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 26
    invoke-virtual {v4, v6, v6, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 27
    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    new-instance v3, Landroid/widget/ProgressBar;

    invoke-direct {v3, p1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 29
    .local v3, "pgBar":Landroid/widget/ProgressBar;
    invoke-virtual {v3, v6, v6, v6, v6}, Landroid/widget/ProgressBar;->setPadding(IIII)V

    .line 30
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 31
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 32
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 33
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    iput-object v5, p0, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dialog:Landroid/app/Dialog;

    .line 35
    iget-object v5, p0, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dialog:Landroid/app/Dialog;

    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 36
    .local v2, "lp":Landroid/view/WindowManager$LayoutParams;
    const v5, 0x3f333333    # 0.7f

    iput v5, v2, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 37
    iget-object v5, p0, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dialog:Landroid/app/Dialog;

    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 38
    iget-object v5, p0, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dialog:Landroid/app/Dialog;

    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/view/Window;->addFlags(I)V

    .line 39
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 58
    return-void
.end method

.method public setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/content/DialogInterface$OnKeyListener;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 48
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 53
    return-void
.end method
