	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074234
sub_08074234: @ 0x08074234
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, [sp, #0x10]
	cmp r5, #0
	bne _08074242
	adds r0, r2, #0
	b _080742F6
_08074242:
	cmp r0, #5
	bhi _080742F4
	lsls r0, r0, #2
	ldr r1, _08074250 @ =_08074254
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08074250: .4byte _08074254
_08074254: @ jump table
	.4byte _0807426C @ case 0
	.4byte _08074278 @ case 1
	.4byte _08074288 @ case 2
	.4byte _0807429C @ case 3
	.4byte _080742C0 @ case 4
	.4byte _080742D2 @ case 5
_0807426C:
	subs r0, r2, r6
	adds r2, r0, #0
	muls r2, r3, r2
	adds r0, r2, #0
	adds r1, r5, #0
	b _080742B8
_08074278:
	adds r0, r3, #0
	muls r0, r3, r0
	subs r1, r2, r6
	adds r2, r0, #0
	muls r2, r1, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _080742B6
_08074288:
	adds r0, r3, #0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	b _080742B2
_0807429C:
	adds r0, r3, #0
	muls r0, r3, r0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	muls r0, r5, r0
_080742B2:
	adds r1, r0, #0
	muls r1, r5, r1
_080742B6:
	adds r0, r2, #0
_080742B8:
	bl Div
	adds r0, r6, r0
	b _080742F6
_080742C0:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _080742E8
_080742D2:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r0, #0
	muls r1, r5, r1
_080742E8:
	adds r0, r2, #0
	bl Div
	adds r4, r6, r4
	subs r0, r4, r0
	b _080742F6
_080742F4:
	movs r0, #0
_080742F6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

