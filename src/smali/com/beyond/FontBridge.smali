.class public Lcom/beyond/FontBridge;
.super Ljava/lang/Object;
.source "FontBridge.java"


# static fields
.field public static FACE_MONOSPACE:I

.field public static FACE_PROPORTIONAL:I

.field public static FACE_SYSTEM:I

.field public static SIZE_BIG:I

.field public static SIZE_HUGE:I

.field public static SIZE_LARGE:I

.field public static SIZE_MEDIUM:I

.field public static SIZE_SMALL:I

.field public static STYLE_UNDERLINED:I


# instance fields
.field protected face:I

.field font_paint:Landroid/graphics/Paint;

.field protected size:I

.field protected style:I

.field private tf:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/16 v0, 0x20

    sput v0, Lcom/beyond/FontBridge;->FACE_MONOSPACE:I

    .line 13
    const/16 v0, 0x40

    sput v0, Lcom/beyond/FontBridge;->FACE_PROPORTIONAL:I

    .line 14
    const/4 v0, 0x0

    sput v0, Lcom/beyond/FontBridge;->FACE_SYSTEM:I

    .line 16
    const/4 v0, 0x4

    sput v0, Lcom/beyond/FontBridge;->STYLE_UNDERLINED:I

    .line 18
    const/16 v0, 0x14

    sput v0, Lcom/beyond/FontBridge;->SIZE_BIG:I

    .line 19
    const/16 v0, 0x1c

    sput v0, Lcom/beyond/FontBridge;->SIZE_HUGE:I

    .line 20
    const/16 v0, 0x10

    sput v0, Lcom/beyond/FontBridge;->SIZE_LARGE:I

    .line 21
    const/16 v0, 0xe

    sput v0, Lcom/beyond/FontBridge;->SIZE_MEDIUM:I

    .line 22
    const/16 v0, 0xc

    sput v0, Lcom/beyond/FontBridge;->SIZE_SMALL:I

    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object v0, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    .line 32
    iput-object v0, p0, Lcom/beyond/FontBridge;->tf:Landroid/graphics/Typeface;

    .line 11
    return-void
.end method


# virtual methods
.method protected charsWidth0([CII)I
    .locals 6
    .param p1, "ch"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 67
    if-gez p2, :cond_0

    .line 68
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 70
    :cond_0
    if-gez p3, :cond_1

    .line 71
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 74
    :cond_1
    array-length v4, p1

    sub-int/2addr v4, p3

    if-le p2, v4, :cond_2

    .line 75
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 78
    :cond_2
    if-nez p3, :cond_5

    array-length v4, p1

    if-ne p2, v4, :cond_5

    .line 79
    array-length v4, p1

    if-nez v4, :cond_4

    .line 80
    const/4 v2, 0x0

    .line 91
    :cond_3
    return v2

    .line 81
    :cond_4
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 84
    :cond_5
    new-array v3, p3, [F

    .line 85
    .local v3, "wid":[F
    iget-object v4, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    invoke-virtual {v4, p1, p2, p3, v3}, Landroid/graphics/Paint;->getTextWidths([CII[F)I

    move-result v1

    .line 87
    .local v1, "ret":I
    const/4 v2, 0x0

    .line 88
    .local v2, "w":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_3

    .line 89
    int-to-float v4, v2

    aget v5, v3, v0

    add-float/2addr v4, v5

    float-to-int v2, v4

    .line 88
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getBaselinePosition()I
    .locals 2

    .prologue
    .line 95
    iget-object v1, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 96
    .local v0, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget v1, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    return v1
.end method

.method public getHeight()I
    .locals 3

    .prologue
    .line 100
    iget-object v1, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 102
    .local v0, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget v1, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v2, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v1, v2

    return v1
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 139
    iget v0, p0, Lcom/beyond/FontBridge;->size:I

    return v0
.end method

.method getUserDefinedFontSize(I)I
    .locals 2
    .param p1, "size"    # I

    .prologue
    .line 49
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getUserFontSize()[I

    move-result-object v0

    .line 50
    .local v0, "userFontSize":[I
    if-nez v0, :cond_0

    .line 59
    .end local p1    # "size":I
    :goto_0
    return p1

    .line 53
    .restart local p1    # "size":I
    :cond_0
    sget v1, Lcom/beyond/FontBridge;->SIZE_SMALL:I

    if-ne p1, v1, :cond_1

    .line 54
    const/4 v1, 0x0

    aget p1, v0, v1

    goto :goto_0

    .line 55
    :cond_1
    sget v1, Lcom/beyond/FontBridge;->SIZE_MEDIUM:I

    if-ne p1, v1, :cond_2

    .line 56
    const/4 v1, 0x1

    aget p1, v0, v1

    goto :goto_0

    .line 57
    :cond_2
    sget v1, Lcom/beyond/FontBridge;->SIZE_LARGE:I

    if-ne p1, v1, :cond_3

    .line 58
    const/4 v1, 0x2

    aget p1, v0, v1

    goto :goto_0

    .line 59
    :cond_3
    const/4 p1, -0x1

    goto :goto_0
.end method

.method protected init(III)V
    .locals 3
    .param p1, "face"    # I
    .param p2, "style"    # I
    .param p3, "size"    # I

    .prologue
    .line 35
    invoke-virtual {p0, p3}, Lcom/beyond/FontBridge;->getUserDefinedFontSize(I)I

    move-result v0

    .line 36
    .local v0, "fontSize":I
    sget v1, Lcom/beyond/FontBridge;->FACE_MONOSPACE:I

    if-ne p1, v1, :cond_1

    .line 37
    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-static {v1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/FontBridge;->tf:Landroid/graphics/Typeface;

    .line 43
    :cond_0
    :goto_0
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    .line 44
    iget-object v1, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    int-to-float v2, v0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 45
    iget-object v1, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/beyond/FontBridge;->tf:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 46
    return-void

    .line 38
    :cond_1
    sget v1, Lcom/beyond/FontBridge;->FACE_PROPORTIONAL:I

    if-ne p1, v1, :cond_2

    .line 39
    sget-object v1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-static {v1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/FontBridge;->tf:Landroid/graphics/Typeface;

    goto :goto_0

    .line 40
    :cond_2
    sget v1, Lcom/beyond/FontBridge;->FACE_SYSTEM:I

    if-ne p1, v1, :cond_0

    .line 41
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-static {v1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/FontBridge;->tf:Landroid/graphics/Typeface;

    goto :goto_0
.end method

.method public isUnderlined()Z
    .locals 2

    .prologue
    .line 143
    iget v0, p0, Lcom/beyond/FontBridge;->style:I

    sget v1, Lcom/beyond/FontBridge;->STYLE_UNDERLINED:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setImgFont(Ljava/lang/String;I)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "size"    # I

    .prologue
    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public stringWidth(Ljava/lang/String;)I
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 106
    const/4 v0, 0x0

    .line 108
    .local v0, "w":I
    iget-object v1, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    float-to-int v0, v1

    .line 109
    return v0
.end method

.method public substringWidth(Ljava/lang/String;II)I
    .locals 6
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .prologue
    .line 113
    if-gez p2, :cond_0

    .line 114
    new-instance v4, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 116
    :cond_0
    if-gez p3, :cond_1

    .line 117
    new-instance v4, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 120
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, p3

    if-le p2, v4, :cond_2

    .line 121
    new-instance v4, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 124
    :cond_2
    if-nez p3, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ne p2, v4, :cond_5

    .line 125
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_4

    .line 126
    const/4 v2, 0x0

    .line 135
    :cond_3
    return v2

    .line 127
    :cond_4
    new-instance v4, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 130
    :cond_5
    new-array v3, p3, [F

    .line 131
    .local v3, "wid":[F
    iget-object v4, p0, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    add-int v5, p3, p2

    invoke-virtual {v4, p1, p2, v5, v3}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;II[F)I

    move-result v1

    .line 132
    .local v1, "ret":I
    const/4 v2, 0x0

    .line 133
    .local v2, "w":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_3

    .line 134
    int-to-float v4, v2

    aget v5, v3, v0

    add-float/2addr v4, v5

    float-to-int v2, v4

    .line 133
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
