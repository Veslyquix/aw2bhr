	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002E5C
sub_08002E5C: @ 0x08002E5C
	push {lr}
	ldr r0, _08002E94 @ =gUnknown_0808D8AC
	ldr r1, _08002E98 @ =0x06014D40
	movs r2, #0x8c
	lsls r2, r2, #3
	bl sub_08011E54
	bl sub_08002EF8
	ldr r0, _08002E9C @ =gUnknown_0808DD0C
	ldr r1, _08002EA0 @ =0x06016180
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08011E54
	ldr r0, _08002EA4 @ =gUnknown_0808DF0C
	ldr r1, _08002EA8 @ =0x06016140
	movs r2, #0x20
	bl sub_08011E54
	ldr r0, _08002EAC @ =gUnknown_0808DF2C
	ldr r1, _08002EB0 @ =0x06016160
	movs r2, #0x20
	bl sub_08011E54
	pop {r0}
	bx r0
	.align 2, 0
_08002E94: .4byte gUnknown_0808D8AC
_08002E98: .4byte 0x06014D40
_08002E9C: .4byte gUnknown_0808DD0C
_08002EA0: .4byte 0x06016180
_08002EA4: .4byte gUnknown_0808DF0C
_08002EA8: .4byte 0x06016140
_08002EAC: .4byte gUnknown_0808DF2C
_08002EB0: .4byte 0x06016160

