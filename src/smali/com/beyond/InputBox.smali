.class public Lcom/beyond/InputBox;
.super Landroid/widget/EditText;
.source "InputBox.java"


# static fields
.field public static final CONSTRAINT_ANY:I = 0x0

.field public static final CONSTRAINT_EMAILADDRESS:I = 0x3

.field public static final CONSTRAINT_NUMBER:I = 0x1

.field public static final CONSTRAINT_PASSWORD:I = 0x2

.field public static final CONSTRAINT_PHONENUMBER:I = 0x5

.field public static final CONSTRAINT_URL:I = 0x4

.field static digitKeyListener:Landroid/text/method/DigitsKeyListener;

.field public static inputConstraint:I

.field static keyListener:Landroid/text/method/KeyListener;


# instance fields
.field _isReturnPressed:Z

.field currentStr:Ljava/lang/String;

.field private isEditing:Z

.field isNeedReset:Z

.field objListener:Lcom/beyond/util/ObjectListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 34
    const/4 v0, -0x1

    sput v0, Lcom/beyond/InputBox;->inputConstraint:I

    .line 35
    sput-object v1, Lcom/beyond/InputBox;->keyListener:Landroid/text/method/KeyListener;

    .line 36
    sput-object v1, Lcom/beyond/InputBox;->digitKeyListener:Landroid/text/method/DigitsKeyListener;

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 29
    iput-object v1, p0, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    .line 30
    iput-object v1, p0, Lcom/beyond/InputBox;->currentStr:Ljava/lang/String;

    .line 31
    iput-boolean v0, p0, Lcom/beyond/InputBox;->isEditing:Z

    .line 32
    iput-boolean v0, p0, Lcom/beyond/InputBox;->isNeedReset:Z

    .line 165
    iput-boolean v0, p0, Lcom/beyond/InputBox;->_isReturnPressed:Z

    .line 46
    invoke-virtual {p0}, Lcom/beyond/InputBox;->getKeyListener()Landroid/text/method/KeyListener;

    move-result-object v0

    sput-object v0, Lcom/beyond/InputBox;->keyListener:Landroid/text/method/KeyListener;

    .line 47
    return-void
.end method

.method private onChangEditState(Z)V
    .locals 1
    .param p1, "mode"    # Z

    .prologue
    .line 51
    if-eqz p1, :cond_0

    .line 52
    iget-object v0, p0, Lcom/beyond/InputBox;->currentStr:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/beyond/InputBox;->setText(Ljava/lang/CharSequence;)V

    .line 53
    invoke-virtual {p0}, Lcom/beyond/InputBox;->requestFocus()Z

    .line 60
    :goto_0
    return-void

    .line 56
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/InputBox;->currentStr:Ljava/lang/String;

    .line 57
    iget-object v0, p0, Lcom/beyond/InputBox;->currentStr:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/beyond/InputBox;->setText(Ljava/lang/CharSequence;)V

    .line 58
    invoke-virtual {p0}, Lcom/beyond/InputBox;->clearFocus()V

    goto :goto_0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 79
    iget-boolean v1, p0, Lcom/beyond/InputBox;->isEditing:Z

    if-eqz v1, :cond_1

    .line 80
    iget-object v1, p0, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    if-nez v1, :cond_0

    .line 81
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/beyond/InputBox;->isEditing:Z

    .line 82
    iget-boolean v1, p0, Lcom/beyond/InputBox;->isEditing:Z

    invoke-direct {p0, v1}, Lcom/beyond/InputBox;->onChangEditState(Z)V

    .line 94
    :cond_0
    :goto_0
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    .line 95
    .local v0, "bxCanvas":Landroid/graphics/Canvas;
    invoke-super {p0, v0}, Landroid/widget/EditText;->onDraw(Landroid/graphics/Canvas;)V

    .line 96
    return-void

    .line 87
    .end local v0    # "bxCanvas":Landroid/graphics/Canvas;
    :cond_1
    iget-object v1, p0, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    if-eqz v1, :cond_0

    .line 88
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/beyond/InputBox;->isEditing:Z

    .line 89
    iget-boolean v1, p0, Lcom/beyond/InputBox;->isEditing:Z

    invoke-direct {p0, v1}, Lcom/beyond/InputBox;->onChangEditState(Z)V

    goto :goto_0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 75
    return-void
.end method

.method public onEditorAction(I)V
    .locals 0
    .param p1, "actionCode"    # I

    .prologue
    .line 111
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 0
    .param p1, "gainFocus"    # Z
    .param p2, "direction"    # I
    .param p3, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    .line 65
    invoke-super {p0, p1, p2, p3}, Landroid/widget/EditText;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 66
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 115
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 153
    const/16 v0, 0x42

    if-ne p1, v0, :cond_0

    .line 154
    const/4 v0, 0x1

    .line 157
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/beyond/InputBox;->getEditableText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "t":Ljava/lang/String;
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 1
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 162
    const/16 v0, 0x64

    invoke-virtual {p0, v0}, Lcom/beyond/InputBox;->offsetTopAndBottom(I)V

    .line 163
    return-void
.end method

.method onPressEnter()V
    .locals 3

    .prologue
    .line 168
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/beyond/InputBox;->_isReturnPressed:Z

    .line 169
    sget-object v1, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 170
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-static {}, Lcom/beyond/JletActivity;->getInputBox()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 171
    return-void
.end method

.method public onPrivateIMECommand(Ljava/lang/String;Landroid/os/Bundle;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "data"    # Landroid/os/Bundle;

    .prologue
    .line 126
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onPrivateIMECommand(Ljava/lang/String;Landroid/os/Bundle;)Z

    move-result v0

    return v0
.end method

.method protected onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "after"    # I

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/beyond/InputBox;->getEditableText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "t":Ljava/lang/String;
    iget-object v1, p0, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    if-eqz v1, :cond_0

    .line 134
    iget-boolean v1, p0, Lcom/beyond/InputBox;->_isReturnPressed:Z

    if-eqz v1, :cond_1

    .line 135
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/beyond/InputBox;->_isReturnPressed:Z

    .line 141
    :cond_0
    :goto_0
    return-void

    .line 138
    :cond_1
    iget-object v1, p0, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/beyond/InputBox;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/beyond/InputBox;->getSelectionEnd()I

    move-result v4

    invoke-interface {v1, v2, v3, v4}, Lcom/beyond/util/ObjectListener;->notifyed(ILjava/lang/Object;I)V

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 146
    const/4 v0, 0x1

    return v0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasWindowFocus"    # Z

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/widget/EditText;->onWindowFocusChanged(Z)V

    .line 72
    return-void
.end method

.method public setConstraint(I)V
    .locals 3
    .param p1, "CONSTRAINT"    # I

    .prologue
    const/4 v2, 0x1

    .line 174
    sput p1, Lcom/beyond/InputBox;->inputConstraint:I

    .line 176
    if-eq p1, v2, :cond_0

    .line 177
    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    .line 178
    const/4 v1, 0x5

    if-ne p1, v1, :cond_2

    .line 179
    :cond_0
    sget-object v1, Lcom/beyond/InputBox;->digitKeyListener:Landroid/text/method/DigitsKeyListener;

    if-nez v1, :cond_1

    .line 180
    new-instance v0, Landroid/text/method/DigitsKeyListener;

    invoke-direct {v0, v2, v2}, Landroid/text/method/DigitsKeyListener;-><init>(ZZ)V

    .line 181
    .local v0, "digitKeyListener":Landroid/text/method/DigitsKeyListener;
    invoke-virtual {p0, v0}, Lcom/beyond/InputBox;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 190
    .end local v0    # "digitKeyListener":Landroid/text/method/DigitsKeyListener;
    :goto_0
    return-void

    .line 184
    :cond_1
    sget-object v1, Lcom/beyond/InputBox;->digitKeyListener:Landroid/text/method/DigitsKeyListener;

    invoke-virtual {p0, v1}, Lcom/beyond/InputBox;->setKeyListener(Landroid/text/method/KeyListener;)V

    goto :goto_0

    .line 187
    :cond_2
    sget-object v1, Lcom/beyond/InputBox;->keyListener:Landroid/text/method/KeyListener;

    invoke-virtual {p0, v1}, Lcom/beyond/InputBox;->setKeyListener(Landroid/text/method/KeyListener;)V

    goto :goto_0
.end method
