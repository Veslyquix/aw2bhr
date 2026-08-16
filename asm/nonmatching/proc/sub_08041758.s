	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041758
sub_08041758: @ 0x08041758
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
	ldr r0, _08041780 @ =gUnknown_03003F20
	ldr r5, [r0]
	ldr r0, _08041784 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08041788
	movs r0, #0
	b _08041804
	.align 2, 0
_08041780: .4byte gUnknown_03003F20
_08041784: .4byte gUnknown_030040D8
_08041788:
	movs r7, #0
	ldr r1, _08041814 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp sb, r0
	bge _080417FE
	adds r3, r1, #0
_08041796:
	movs r4, #0
	ldr r0, [r3]
	adds r1, r7, #1
	mov r8, r1
	ldrh r0, [r0]
	cmp r4, r0
	bge _080417F4
	ldr r1, _08041818 @ =gUnknown_03003340
	lsls r0, r7, #2
	adds r6, r0, r1
	lsls r2, r7, #0x10
_080417AC:
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080417EA
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	asrs r1, r2, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl sub_0804247C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #1
	bne _080417EA
	movs r0, #1
	add sb, r0
	strb r4, [r5]
	strb r7, [r5, #1]
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #2]
	adds r5, #4
_080417EA:
	adds r4, #1
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r4, r0
	blt _080417AC
_080417F4:
	mov r7, r8
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _08041796
_080417FE:
	ldr r0, _0804181C @ =0x0000FFFF
	strh r0, [r5, #2]
	mov r0, sb
_08041804:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041814: .4byte gUnknown_08499590
_08041818: .4byte gUnknown_03003340
_0804181C: .4byte 0x0000FFFF

