.class public Lcom/beyond/CletView;
.super Landroid/view/SurfaceView;
.source "CletView.java"


# instance fields
.field protected suiMgr:Lcom/beyond/sui/SUImanager;

.field public x_ratio:F

.field public y_ratio:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 16
    iput v0, p0, Lcom/beyond/CletView;->x_ratio:F

    .line 17
    iput v0, p0, Lcom/beyond/CletView;->y_ratio:F

    .line 19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/CletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    .line 24
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/beyond/sui/SUImanager;->getInstance(Ljava/lang/Object;Z)Lcom/beyond/sui/SUImanager;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/CletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    .line 25
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/beyond/CletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v0, p1}, Lcom/beyond/sui/SUImanager;->paint(Landroid/graphics/Canvas;)V

    .line 52
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const-string v5, "VTOUCH"
    const-string v4, "HERMES_DBG"
    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v1, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v2, v4

    sget-object v4, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget v4, v4, Lcom/beyond/CletView;->x_ratio:F

    cmpl-float v4, v4, v7

    if-eqz v4, :cond_0

    int-to-float v4, v1

    sget-object v5, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget v5, v5, Lcom/beyond/CletView;->x_ratio:F

    mul-float/2addr v4, v5

    float-to-int v1, v4

    :cond_0
    sget-object v4, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget v4, v4, Lcom/beyond/CletView;->y_ratio:F

    cmpl-float v4, v4, v7

    if-eqz v4, :cond_1

    int-to-float v4, v2

    sget-object v5, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget v5, v5, Lcom/beyond/CletView;->y_ratio:F

    mul-float/2addr v4, v5

    float-to-int v2, v4

    :cond_1
    const/4 v6, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_2

    sget-object v4, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v4, v1, v2, v6}, Lcom/beyond/AppThread;->BhandleTouchPress(III)V

    goto :goto_0

    :cond_2
    if-ne v0, v3, :cond_3

    sget-object v4, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v4, v1, v2, v6}, Lcom/beyond/AppThread;->BhandleTouchRelease(III)V

    goto :goto_0

    :cond_3
    const/4 v4, 0x2

    if-ne v0, v4, :cond_4

    sget-object v4, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v4, v1, v2, v6}, Lcom/beyond/AppThread;->BhandleTouchDrag(III)V

    :cond_4
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method setScaleRatio(FF)V
    .locals 0
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 28
    iput p1, p0, Lcom/beyond/CletView;->x_ratio:F

    .line 29
    iput p2, p0, Lcom/beyond/CletView;->y_ratio:F

    .line 30
    return-void
.end method

.method public suiGetValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/beyond/CletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v0, p1, p2}, Lcom/beyond/sui/SUImanager;->getValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public suiSetValue(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/beyond/CletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUImanager;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    .line 97
    return-void
.end method

.method public suihide(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/beyond/CletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v0, p1}, Lcom/beyond/sui/SUImanager;->hide(Ljava/lang/String;)V

    .line 85
    const/4 p1, 0x0

    .line 86
    return-void
.end method

.method public suihideall()V
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/beyond/CletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v0}, Lcom/beyond/sui/SUImanager;->hideAll()V

    .line 89
    return-void
.end method

.method public suiinit()V
    .locals 0

    .prologue
    .line 77
    return-void
.end method

.method public suishow(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/beyond/CletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v0, p1}, Lcom/beyond/sui/SUImanager;->show(Ljava/lang/String;)V

    .line 80
    const/4 p1, 0x0

    .line 81
    return-void
.end method
