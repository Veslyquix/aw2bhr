	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BC80
sub_0802BC80: @ 0x0802BC80
	push {r4, lr}
	ldr r3, _0802BCB4 @ =gUnknown_030033E4
	ldrh r0, [r3]
	lsls r0, r0, #4
	ldr r1, _0802BCB8 @ =gUnknown_08499590
	ldr r2, [r1]
	ldrh r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r3, #2]
	lsls r0, r0, #4
	ldrh r1, [r2, #6]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bgt _0802BCC0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	bgt _0802BCC0
	ldr r0, _0802BCBC @ =gUnknown_08090A98
	ldrh r0, [r0, #2]
	b _0802BCC4
	.align 2, 0
_0802BCB4: .4byte gUnknown_030033E4
_0802BCB8: .4byte gUnknown_08499590
_0802BCBC: .4byte gUnknown_08090A98
_0802BCC0:
	ldr r0, _0802BCD4 @ =gUnknown_08090A98
	ldrh r0, [r0]
_0802BCC4:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0802BBDC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BCD4: .4byte gUnknown_08090A98

