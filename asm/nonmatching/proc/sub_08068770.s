	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08068770
sub_08068770: @ 0x08068770
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r4, _08068808 @ =gUnknown_08581248
	adds r0, #0x17
	ldrb r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r1, r0, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r1, r5, r1
	adds r3, r6, #0
	adds r3, #0x39
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldrb r3, [r3]
	adds r7, r0, r3
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r4, r0
	bge _080687E2
	adds r5, r1, #0
_080687B6:
	lsls r1, r4, #4
	ldrh r0, [r6, #0x30]
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _0806880C @ =gUnknown_0858125C
	bl PutSprite
	adds r5, #0x22
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r4, r0
	blt _080687B6
_080687E2:
	adds r1, r6, #0
	adds r1, #0x4f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	subs r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _080687FE
	adds r0, r6, #0
	bl Proc_Break
_080687FE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068808: .4byte gUnknown_08581248
_0806880C: .4byte gUnknown_0858125C

