	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074754
sub_08074754: @ 0x08074754
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r6, _080747E8 @ =gUnknown_0202FE38
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0807477A
_08074770:
	adds r6, #0xc
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, r1
	bne _08074770
_0807477A:
	movs r0, #1
	mov r8, r0
	ldr r1, _080747EC @ =gUnknown_08615194
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r7, r0, #0x10
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r5, r0, r1
	ldrb r1, [r5, #2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0807479C
	movs r0, #2
	mov r8, r0
_0807479C:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080747A8
	movs r1, #3
	mov r8, r1
_080747A8:
	ldr r0, _080747F0 @ =gUnknown_081D2930
	movs r1, #1
	movs r2, #1
	bl sub_0801C210
	adds r4, r0, #0
	mov r1, r8
	bl sub_0801C4D4
	str r4, [r6, #8]
	ldrh r0, [r5, #6]
	strh r0, [r6, #2]
	ldrh r0, [r5, #8]
	strh r0, [r6, #4]
	mov r2, sb
	strh r2, [r6]
	ldr r1, _080747F4 @ =gUnknown_0202FDFC
	adds r1, #0x12
	adds r1, r7, r1
	ldrb r0, [r1]
	ldrb r2, [r5, #2]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080747F8 @ =0x0000FFFF
	strh r0, [r6, #0xc]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080747E8: .4byte gUnknown_0202FE38
_080747EC: .4byte gUnknown_08615194
_080747F0: .4byte gUnknown_081D2930
_080747F4: .4byte gUnknown_0202FDFC
_080747F8: .4byte 0x0000FFFF

