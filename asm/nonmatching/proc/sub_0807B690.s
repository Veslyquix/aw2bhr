	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B690
sub_0807B690: @ 0x0807B690
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x38]
	movs r1, #3
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _0807B720 @ =gUnknown_0822AC60
	adds r0, r0, r1
	movs r1, #0x8e
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
	ldr r0, [r6, #0x38]
	adds r0, #1
	str r0, [r6, #0x38]
	ldr r2, [r6, #0x58]
	movs r0, #0x5b
	movs r1, #0x54
	movs r3, #0
	bl sub_0807B51C
	ldr r2, [r6, #0x5c]
	movs r0, #0x5b
	movs r1, #0x67
	movs r3, #1
	bl sub_0807B51C
	ldr r3, _0807B724 @ =gUnknown_0848B690
	ldr r0, _0807B728 @ =0x00001058
	str r0, [sp]
	movs r0, #0
	movs r1, #0x14
	movs r2, #0x54
	bl PutSprite
	ldr r4, _0807B72C @ =gUnknown_081D9328
	ldr r3, [r4]
	ldr r0, _0807B730 @ =0x0000105C
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa
	movs r2, #0x67
	bl PutSprite
	adds r7, r4, #0
	movs r5, #0x54
	movs r4, #1
_0807B6FA:
	ldr r0, _0807B734 @ =0x00001050
	str r0, [sp]
	movs r0, #0
	movs r1, #0x6c
	adds r2, r5, #0
	ldr r3, [r7]
	bl PutSprite
	adds r5, #0x13
	subs r4, #1
	cmp r4, #0
	bge _0807B6FA
	adds r0, r6, #0
	bl sub_0807B738
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B720: .4byte gUnknown_0822AC60
_0807B724: .4byte gUnknown_0848B690
_0807B728: .4byte 0x00001058
_0807B72C: .4byte gUnknown_081D9328
_0807B730: .4byte 0x0000105C
_0807B734: .4byte 0x00001050

