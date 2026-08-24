.class public Lcom/beyond/KtDrmCheckActivity;
.super Lcom/beyond/CletActivity;
.source "KtDrmCheckActivity.java"


# static fields
.field public static final b_DebugOutput:Z = true


# instance fields
.field drmResult:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/beyond/CletActivity;-><init>()V

    .line 29
    const-string v0, ""

    .line 30
    .local v0, "msg":Ljava/lang/String;
    invoke-static {}, Lcom/beyond/KtDrmCheckActivity;->DrmCheck()I

    move-result v1

    iput v1, p0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    .line 35
    iget v1, p0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .line 37
    const-string v0, "\ucd08\uae30\ud654 \uc2e4\ud328"

    .line 58
    :cond_0
    :goto_0
    iget v1, p0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    const/4 v2, -0x3

    if-eq v1, v2, :cond_1

    .line 63
    const-string v1, "Initialize"

    invoke-virtual {p0, v1, v0}, Lcom/beyond/KtDrmCheckActivity;->showDialogDRM(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    :cond_1
    return-void

    .line 39
    :cond_2
    iget v1, p0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    const/4 v2, -0x2

    if-ne v1, v2, :cond_3

    .line 41
    const-string v0, "USIM\uc744 \uc7a5\uc791 \ud6c4 \ud504\ub85c\uadf8\ub7a8\uc744 \uc2e4\ud589 \ud574 \uc8fc\uc138\uc694."

    goto :goto_0

    .line 43
    :cond_3
    iget v1, p0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    const/4 v2, -0x3

    if-ne v1, v2, :cond_4

    .line 45
    const-string v0, "\ubd88\ubc95 \ubcf5\uc81c \ud504\ub85c\uadf8\ub7a8\uc785\ub2c8\ub2e4. \n \ud504\ub85c\uadf8\ub7a8\uc744 \uc885\ub8cc\ud569\ub2c8\ub2e4."

    goto :goto_0

    .line 52
    :cond_4
    iget v1, p0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    const/4 v2, -0x5

    if-ne v1, v2, :cond_0

    .line 54
    const-string v0, "\ucd08\uae30\ud654\uc131\uacf5"

    goto :goto_0
.end method

.method public static DrmCheck()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lcom/beyond/CletActivity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    return-void
.end method

.method public showDialogDRM(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "_msg"    # Ljava/lang/String;

    .prologue
    .line 150
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 152
    .local v0, "d":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 153
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 154
    const-string v1, "OK"

    new-instance v2, Lcom/beyond/KtDrmCheckActivity$1;

    invoke-direct {v2, p0}, Lcom/beyond/KtDrmCheckActivity$1;-><init>(Lcom/beyond/KtDrmCheckActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 171
    new-instance v1, Lcom/beyond/KtDrmCheckActivity$2;

    invoke-direct {v1, p0}, Lcom/beyond/KtDrmCheckActivity$2;-><init>(Lcom/beyond/KtDrmCheckActivity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    .line 200
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 201
    return-void
.end method
