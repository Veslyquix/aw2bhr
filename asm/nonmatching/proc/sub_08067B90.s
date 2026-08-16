	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067B90
sub_08067B90: @ 0x08067B90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08067BC0 @ =gUnknown_08581050
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08067BC4 @ =0x06001400
	bl sub_08011CAC
	ldr r1, _08067BC8 @ =gUnknown_0858105C
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08067BCC @ =gUnknown_0849957C
	ldr r1, [r1]
	bl sub_08011CAC
	bl sub_08013AFC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067BC0: .4byte gUnknown_08581050
_08067BC4: .4byte 0x06001400
_08067BC8: .4byte gUnknown_0858105C
_08067BCC: .4byte gUnknown_0849957C

