.class public Lcom/beyond/screen/KeyPad;
.super Landroid/widget/RelativeLayout;
.source "KeyPad.java"


# instance fields
.field bg:I

.field btns:[Lcom/beyond/screen/KeyButton;

.field buttonCount:I

.field private image:Landroid/graphics/Bitmap;

.field name:Ljava/lang/String;

.field protected rect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/beyond/screen/KeyPad;-><init>(Landroid/content/Context;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 21
    iput v0, p0, Lcom/beyond/screen/KeyPad;->buttonCount:I

    .line 22
    iput-object v1, p0, Lcom/beyond/screen/KeyPad;->name:Ljava/lang/String;

    .line 23
    iput-object v1, p0, Lcom/beyond/screen/KeyPad;->image:Landroid/graphics/Bitmap;

    .line 28
    invoke-static {v0, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/beyond/screen/KeyPad;->bg:I

    .line 29
    return-void
.end method


# virtual methods
.method public getRect()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    return-object v0
.end method

.method init()V
    .locals 0

    .prologue
    .line 37
    return-void
.end method

.method loadImage(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 44
    if-eqz p1, :cond_0

    .line 45
    invoke-static {p1}, Lcom/beyond/sui/SUIBase;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/screen/KeyPad;->image:Landroid/graphics/Bitmap;

    .line 46
    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 41
    return-void
.end method

.method public setRect(Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "r"    # Landroid/graphics/Rect;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    .line 51
    return-void
.end method
