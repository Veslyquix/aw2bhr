	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076ADC
sub_08076ADC: @ 0x08076ADC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08076888
	ldr r0, _08076B14 @ =gUnknown_081D0BAC
	ldr r4, _08076B18 @ =gUnknown_08614280
	ldr r1, [r4]
	bl sub_08011CAC
	bl sub_08076858
	bl sub_0807681C
	ldr r0, [r4]
	ldr r1, _08076B1C @ =0x0600F000
	movs r2, #0x80
	lsls r2, r2, #5
	bl sub_08011E54
	adds r0, r5, #0
	bl sub_08076C8C
	adds r0, r5, #0
	bl sub_0807639C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076B14: .4byte gUnknown_081D0BAC
_08076B18: .4byte gUnknown_08614280
_08076B1C: .4byte 0x0600F000

