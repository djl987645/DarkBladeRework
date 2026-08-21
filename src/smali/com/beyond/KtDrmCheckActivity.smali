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
    .locals 5

    .prologue
    .line 71
    const/4 v0, 0x0

    return v0

    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    .line 73
    .local v1, "kafManager":Lcom/kaf/KafManager;
    const/4 v2, -0x1

    .line 78
    .local v2, "result":I
    :try_start_0
    sget-object v3, Lcom/beyond/KtDrmCheckActivity;->context:Landroid/content/Context;

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Lcom/kaf/KafManager;->Initialize(Landroid/content/Context;I)I

    move-result v2

    .line 80
    if-nez v2, :cond_1

    .line 85
    const-string v3, "Test Initialize"

    const-string v4, "Initialize Success"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :cond_0
    :goto_0
    return v2

    .line 87
    :cond_1
    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    .line 92
    const-string v3, "Test Initialize"

    const-string v4, "Initialize Fail"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/kaf/GeneralException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 121
    :catch_0
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 126
    const-string v3, "Test Initialize"

    const-string v4, "IllegalAccessException"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 94
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_2
    const/4 v3, -0x2

    if-ne v2, v3, :cond_3

    .line 99
    :try_start_1
    const-string v3, "Test Initialize"

    const-string v4, "Initialize Fail"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/kaf/GeneralException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 128
    :catch_1
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    .line 133
    const-string v3, "Test Initialize"

    const-string v4, "IllegalArgumentException"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 101
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_3
    const/4 v3, -0x3

    if-ne v2, v3, :cond_4

    .line 106
    :try_start_2
    const-string v3, "Test Initialize"

    const-string v4, "Initialize Fail"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lcom/kaf/GeneralException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 135
    :catch_2
    move-exception v0

    .line 137
    .local v0, "e":Lcom/kaf/GeneralException;
    invoke-virtual {v0}, Lcom/kaf/GeneralException;->printStackTrace()V

    .line 140
    const-string v3, "Test Initialize"

    const-string v4, "GeneralException"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 113
    .end local v0    # "e":Lcom/kaf/GeneralException;
    :cond_4
    const/4 v3, -0x5

    if-ne v2, v3, :cond_0

    .line 118
    :try_start_3
    const-string v3, "Test Initialize"

    const-string v4, "Initialize Fail"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/kaf/GeneralException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0
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
