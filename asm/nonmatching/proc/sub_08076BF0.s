	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076BF0
sub_08076BF0: @ 0x08076BF0
	push {lr}
	adds r3, r0, #0
	ldr r1, _08076C14 @ =gUnknown_0861500C
	ldr r2, _08076C18 @ =gUnknown_0202FDFC
	ldr r0, [r2, #0xc]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r2, #0x11]
	cmp r0, #1
	bne _08076C10
	adds r0, r1, #0
	adds r1, r3, #0
	bl sub_08078480
_08076C10:
	pop {r0}
	bx r0
	.align 2, 0
_08076C14: .4byte gUnknown_0861500C
_08076C18: .4byte gUnknown_0202FDFC

