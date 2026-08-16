	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B66C
sub_0801B66C: @ 0x0801B66C
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B68C @ =gUnknown_0200CD0C
	ldrb r0, [r0]
	cmp r0, #1
	bne _0801B684
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_0808AE54
_0801B684:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B68C: .4byte gUnknown_0200CD0C

