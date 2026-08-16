	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F6BC
sub_0803F6BC: @ 0x0803F6BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	ldr r6, _0803F6E4 @ =gUnknown_080CFFC4
	ldr r0, _0803F6E8 @ =gUnknown_080D16C4
	mov r8, r0
	cmp r3, #0
	bne _0803F6D4
	b _0803F7FE
_0803F6D4:
	subs r0, r4, #6
	cmp r0, #0xb
	bhi _0803F720
	lsls r0, r0, #2
	ldr r1, _0803F6EC @ =_0803F6F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F6E4: .4byte gUnknown_080CFFC4
_0803F6E8: .4byte gUnknown_080D16C4
_0803F6EC: .4byte _0803F6F0
_0803F6F0: @ jump table
	.4byte _0803F79C @ case 0
	.4byte _0803F720 @ case 1
	.4byte _0803F740 @ case 2
	.4byte _0803F720 @ case 3
	.4byte _0803F780 @ case 4
	.4byte _0803F764 @ case 5
	.4byte _0803F720 @ case 6
	.4byte _0803F720 @ case 7
	.4byte _0803F7B8 @ case 8
	.4byte _0803F720 @ case 9
	.4byte _0803F720 @ case 10
	.4byte _0803F7E4 @ case 11
_0803F720:
	adds r0, r4, #0
	movs r1, #0
	bl sub_0802A880
	adds r0, #0x40
	adds r1, r5, #0
	movs r2, #0xc0
	bl sub_08011E54
	ldr r0, _0803F73C @ =gUnknown_08485A2C
	adds r1, r5, #0
	adds r1, #0xc0
	b _0803F7D8
	.align 2, 0
_0803F73C: .4byte gUnknown_08485A2C
_0803F740:
	adds r0, r7, #0
	bl sub_08042DE0
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, _0803F760 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	add r0, r8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, #0
	bl sub_08011E54
	b _0803F7FE
	.align 2, 0
_0803F760: .4byte 0x000003FF
_0803F764:
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r6, r1
	adds r1, r5, #0
	movs r2, #0xc0
	bl sub_08011E54
	ldr r0, _0803F77C @ =gUnknown_08485A2C
	adds r1, r5, #0
	adds r1, #0xc0
	b _0803F7D8
	.align 2, 0
_0803F77C: .4byte gUnknown_08485A2C
_0803F780:
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r6, r1
	adds r1, r5, #0
	movs r2, #0xc0
	bl sub_08011E54
	ldr r0, _0803F798 @ =gUnknown_08485A2C
	adds r1, r5, #0
	adds r1, #0xc0
	b _0803F7D8
	.align 2, 0
_0803F798: .4byte gUnknown_08485A2C
_0803F79C:
	movs r1, #0x88
	lsls r1, r1, #3
	adds r0, r6, r1
	adds r1, r5, #0
	movs r2, #0xc0
	bl sub_08011E54
	ldr r0, _0803F7B4 @ =gUnknown_08485A2C
	adds r1, r5, #0
	adds r1, #0xc0
	b _0803F7D8
	.align 2, 0
_0803F7B4: .4byte gUnknown_08485A2C
_0803F7B8:
	ldr r4, _0803F7E0 @ =gUnknown_08485A2C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl sub_08011E54
	adds r0, r6, #0
	adds r0, #0x80
	adds r1, r5, #0
	adds r1, #0x40
	movs r2, #0x80
	bl sub_08011E54
	adds r1, r5, #0
	adds r1, #0xc0
	adds r0, r4, #0
_0803F7D8:
	movs r2, #0x40
	bl sub_08011E54
	b _0803F7FE
	.align 2, 0
_0803F7E0: .4byte gUnknown_08485A2C
_0803F7E4:
	movs r1, #0xa4
	lsls r1, r1, #4
	adds r0, r6, r1
	adds r1, r5, #0
	movs r2, #0xc0
	bl sub_08011E54
	ldr r0, _0803F808 @ =gUnknown_08485A2C
	adds r1, r5, #0
	adds r1, #0xc0
	movs r2, #0x40
	bl sub_08011E54
_0803F7FE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F808: .4byte gUnknown_08485A2C

