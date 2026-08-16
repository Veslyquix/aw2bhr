	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080A70
sub_08080A70: @ 0x08080A70
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, _08080AD0 @ =0x000011CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa8
	movs r1, #0xa0
	movs r3, #2
	bl sub_08043C28
	movs r4, #0
	ldr r0, [r6, #0x58]
	cmp r4, r0
	bge _08080AB2
	ldr r7, _08080AD4 @ =gUnknown_030058D0
	ldr r5, _08080AD8 @ =0x0000030A
_08080A92:
	ldr r0, _08080ADC @ =gUnknown_030059A0
	adds r0, r4, r0
	ldrb r0, [r0]
	ldr r1, [r7]
	adds r1, r1, r0
	str r5, [sp]
	movs r0, #0
	movs r2, #0x40
	ldr r3, _08080AE0 @ =gUnknown_0848B6E6
	bl PutSprite
	adds r5, #8
	adds r4, #1
	ldr r0, [r6, #0x58]
	cmp r4, r0
	blt _08080A92
_08080AB2:
	adds r3, r6, #0
	adds r3, #0x4c
	movs r0, #0
	ldrsh r2, [r3, r0]
	ldr r1, [r6, #0x58]
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #3
	cmp r2, r0
	bge _08080AE4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	b _08080AEE
	.align 2, 0
_08080AD0: .4byte 0x000011CA
_08080AD4: .4byte gUnknown_030058D0
_08080AD8: .4byte 0x0000030A
_08080ADC: .4byte gUnknown_030059A0
_08080AE0: .4byte gUnknown_0848B6E6
_08080AE4:
	movs r0, #0
	strh r0, [r3]
	adds r0, r6, #0
	bl Proc_Break
_08080AEE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

