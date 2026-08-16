	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010EF8
sub_08010EF8: @ 0x08010EF8
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	lsls r0, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsrs r0, r0, #0xf
	adds r0, #0x40
	adds r5, r5, r0
	ldr r6, _08010F34 @ =gUnknown_0808DF8C
_08010F0A:
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	ldr r1, [r6]
	ldrh r1, [r1]
	adds r1, r1, r0
	strh r1, [r5]
	subs r5, #2
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08010F0A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010F34: .4byte gUnknown_0808DF8C

