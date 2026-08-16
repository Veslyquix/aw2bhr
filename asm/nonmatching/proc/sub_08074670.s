	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074670
sub_08074670: @ 0x08074670
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r5, _08074708 @ =gUnknown_0202FE38
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080746FC
	adds r6, r5, #0
	subs r6, #0x3c
	mov r8, r1
_0807468E:
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r6, #0
	adds r1, #0x12
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080746F2
	movs r7, #2
	ldrsh r1, [r5, r7]
	movs r2, #0
	ldrsh r0, [r6, r2]
	subs r4, r1, r0
	movs r7, #4
	ldrsh r1, [r5, r7]
	movs r2, #2
	ldrsh r0, [r6, r2]
	subs r3, r1, r0
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080746F2
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r3, r0
	blt _080746F2
	cmp r3, #0xa0
	bgt _080746F2
	ldr r2, [r5, #8]
	ldrh r1, [r2, #0x22]
	ldr r7, _0807470C @ =0x0000F3FF
	adds r0, r7, #0
	ands r1, r0
	mov r7, sb
	ldr r0, [r7, #0x58]
	orrs r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r5, #8]
	ldr r1, _08074710 @ =0x000001FF
	ands r4, r1
	movs r1, #0xff
	ands r3, r1
	adds r1, r4, #0
	adds r2, r3, #0
	bl sub_0801C254
_080746F2:
	adds r5, #0xc
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r8
	bne _0807468E
_080746FC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074708: .4byte gUnknown_0202FE38
_0807470C: .4byte 0x0000F3FF
_08074710: .4byte 0x000001FF

