	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807FC70
sub_0807FC70: @ 0x0807FC70
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, _0807FCD4 @ =0x000041CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa8
	movs r1, #0xa0
	movs r3, #2
	bl sub_08043C28
	movs r4, #0
	ldr r0, [r6, #0x58]
	cmp r4, r0
	bge _0807FCB4
	ldr r5, _0807FCD8 @ =0x0000030A
_0807FC90:
	ldr r0, _0807FCDC @ =gUnknown_030059A0
	adds r0, r4, r0
	ldrb r1, [r0]
	adds r1, #8
	movs r0, #0xc0
	lsls r0, r0, #6
	orrs r0, r5
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	ldr r3, _0807FCE0 @ =gUnknown_0848B6E6
	bl PutSprite
	adds r5, #8
	adds r4, #1
	ldr r0, [r6, #0x58]
	cmp r4, r0
	blt _0807FC90
_0807FCB4:
	adds r3, r6, #0
	adds r3, #0x4c
	movs r0, #0
	ldrsh r2, [r3, r0]
	ldr r1, [r6, #0x58]
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x38
	cmp r2, r0
	bge _0807FCE4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	b _0807FCEE
	.align 2, 0
_0807FCD4: .4byte 0x000041CA
_0807FCD8: .4byte 0x0000030A
_0807FCDC: .4byte gUnknown_030059A0
_0807FCE0: .4byte gUnknown_0848B6E6
_0807FCE4:
	movs r0, #0
	strh r0, [r3]
	adds r0, r6, #0
	bl Proc_Break
_0807FCEE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

