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
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 55
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
