	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028B70
sub_08028B70: @ 0x08028B70
	ldr r0, _08028B7C @ =gUnknown_03003FC0
	adds r0, #0x31
	ldrb r2, [r0]
	cmp r2, #0
	bne _08028B84
	b _08028BA2
	.align 2, 0
_08028B7C: .4byte gUnknown_03003FC0
_08028B80:
	adds r0, r1, #0
	b _08028BA4
_08028B84:
	movs r1, #1
	ldr r0, _08028BA8 @ =gUnknown_08499598
	ldr r3, [r0]
_08028B8A:
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0x11]
	cmp r0, r2
	bhs _08028B80
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _08028B8A
_08028BA2:
	movs r0, #0
_08028BA4:
	bx lr
	.align 2, 0
_08028BA8: .4byte gUnknown_08499598

