	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080765D8
sub_080765D8: @ 0x080765D8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, _08076624 @ =gUnknown_086144C0
	movs r5, #0
	str r5, [sp]
	movs r0, #1
	bl sub_0801BEBC
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	adds r1, r1, r0
	ldr r2, [r4, #0x30]
	adds r2, #0x10
	ldr r3, _08076628 @ =gUnknown_086144D4
	str r5, [sp]
	movs r0, #1
	bl sub_0801BEFC
	bl sub_080763C0
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0807661A
	str r5, [r4, #0x5c]
	adds r0, r4, #0
	bl Proc_Break
_0807661A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076624: .4byte gUnknown_086144C0
_08076628: .4byte gUnknown_086144D4

